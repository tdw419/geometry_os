; DESCRIPTION: Places a red line segment connecting (81, 189) to (132, 213).
; PLAN: r0=81(x1), r1=189(y1), r2=132(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 189
LDI r2, 132
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
