; DESCRIPTION: Draws a blue line from (268, 215) to (495, 4).
; PLAN: r0=268(x1), r1=215(y1), r2=495(x2), r3=4(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 215
LDI r2, 495
LDI r3, 4
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
