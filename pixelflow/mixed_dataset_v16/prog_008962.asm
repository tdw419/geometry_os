; DESCRIPTION: Places a white line segment connecting (132, 254) to (207, 243).
; PLAN: r0=132(x1), r1=254(y1), r2=207(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 254
LDI r2, 207
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
