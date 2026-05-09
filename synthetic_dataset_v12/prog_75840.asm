; DESCRIPTION: Renders a green line between points (371, 249) and (50, 230).
; PLAN: r0=371(x1), r1=249(y1), r2=50(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 249
LDI r2, 50
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
