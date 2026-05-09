; DESCRIPTION: Renders a white line between points (24, 69) and (406, 132).
; PLAN: r0=24(x1), r1=69(y1), r2=406(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 69
LDI r2, 406
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
