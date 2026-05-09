; DESCRIPTION: Renders a magenta line between points (406, 230) and (495, 45).
; PLAN: r0=406(x1), r1=230(y1), r2=495(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 230
LDI r2, 495
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
