; DESCRIPTION: Places a black line segment connecting (126, 151) to (253, 226).
; PLAN: r0=126(x1), r1=151(y1), r2=253(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 151
LDI r2, 253
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
