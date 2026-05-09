; DESCRIPTION: Draws a blue line from (215, 130) to (374, 126).
; PLAN: r0=215(x1), r1=130(y1), r2=374(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 130
LDI r2, 374
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
