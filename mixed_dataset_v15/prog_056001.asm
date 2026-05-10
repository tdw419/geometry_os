; DESCRIPTION: Places a black line segment connecting (159, 97) to (420, 243).
; PLAN: r0=159(x1), r1=97(y1), r2=420(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 97
LDI r2, 420
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
