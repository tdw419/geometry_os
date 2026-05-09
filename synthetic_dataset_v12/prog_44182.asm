; DESCRIPTION: Places a yellow line segment connecting (409, 213) to (122, 87).
; PLAN: r0=409(x1), r1=213(y1), r2=122(x2), r3=87(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 213
LDI r2, 122
LDI r3, 87
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
