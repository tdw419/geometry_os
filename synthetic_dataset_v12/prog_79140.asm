; DESCRIPTION: Places a black line segment connecting (274, 151) to (70, 213).
; PLAN: r0=274(x1), r1=151(y1), r2=70(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 151
LDI r2, 70
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
