; DESCRIPTION: Places a black line segment connecting (463, 171) to (231, 213).
; PLAN: r0=463(x1), r1=171(y1), r2=231(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 171
LDI r2, 231
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
