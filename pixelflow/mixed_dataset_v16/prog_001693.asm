; DESCRIPTION: Places a green line segment connecting (296, 56) to (499, 240).
; PLAN: r0=296(x1), r1=56(y1), r2=499(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 56
LDI r2, 499
LDI r3, 240
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
