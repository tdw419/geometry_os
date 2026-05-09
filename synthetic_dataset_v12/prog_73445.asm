; DESCRIPTION: Draws a yellow line from (256, 211) to (118, 215).
; PLAN: r0=256(x1), r1=211(y1), r2=118(x2), r3=215(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 211
LDI r2, 118
LDI r3, 215
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
