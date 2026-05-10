; DESCRIPTION: Places a green line segment connecting (298, 158) to (256, 180).
; PLAN: r0=298(x1), r1=158(y1), r2=256(x2), r3=180(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 158
LDI r2, 256
LDI r3, 180
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
