; DESCRIPTION: Places a yellow line segment connecting (188, 5) to (210, 213).
; PLAN: r0=188(x1), r1=5(y1), r2=210(x2), r3=213(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 5
LDI r2, 210
LDI r3, 213
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
