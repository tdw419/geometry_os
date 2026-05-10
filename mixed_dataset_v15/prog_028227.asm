; DESCRIPTION: Draws a white line from (394, 127) to (134, 192).
; PLAN: r0=394(x1), r1=127(y1), r2=134(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 127
LDI r2, 134
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
