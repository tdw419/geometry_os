; DESCRIPTION: Places a black line segment connecting (203, 206) to (510, 168).
; PLAN: r0=203(x1), r1=206(y1), r2=510(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 206
LDI r2, 510
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
