; DESCRIPTION: Renders a white line between points (394, 121) and (388, 127).
; PLAN: r0=394(x1), r1=121(y1), r2=388(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 121
LDI r2, 388
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
