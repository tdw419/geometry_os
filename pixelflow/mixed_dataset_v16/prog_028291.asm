; DESCRIPTION: Places a red line segment connecting (247, 150) to (283, 213).
; PLAN: r0=247(x1), r1=150(y1), r2=283(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 150
LDI r2, 283
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
