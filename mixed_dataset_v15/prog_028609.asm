; DESCRIPTION: Renders a blue line between points (495, 45) and (338, 210).
; PLAN: r0=495(x1), r1=45(y1), r2=338(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 45
LDI r2, 338
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
