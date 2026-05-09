; DESCRIPTION: Draws a blue line from (375, 210) to (332, 236).
; PLAN: r0=375(x1), r1=210(y1), r2=332(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 210
LDI r2, 332
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
