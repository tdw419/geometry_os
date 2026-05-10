; DESCRIPTION: Draws a purple line from (224, 74) to (360, 176).
; PLAN: r0=224(x1), r1=74(y1), r2=360(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 74
LDI r2, 360
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
