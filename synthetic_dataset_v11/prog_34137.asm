; DESCRIPTION: Draws a yellow line from (237, 224) to (202, 230).
; PLAN: r0=237(x1), r1=224(y1), r2=202(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 224
LDI r2, 202
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
