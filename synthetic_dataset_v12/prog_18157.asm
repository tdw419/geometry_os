; DESCRIPTION: Renders a white line between points (394, 6) and (39, 208).
; PLAN: r0=394(x1), r1=6(y1), r2=39(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 6
LDI r2, 39
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
