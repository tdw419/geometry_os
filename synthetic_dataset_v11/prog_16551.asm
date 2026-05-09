; DESCRIPTION: Draws a green line from (150, 237) to (21, 212).
; PLAN: r0=150(x1), r1=237(y1), r2=21(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 237
LDI r2, 21
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
