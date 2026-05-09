; DESCRIPTION: Places a yellow line segment connecting (160, 213) to (253, 186).
; PLAN: r0=160(x1), r1=213(y1), r2=253(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 213
LDI r2, 253
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
