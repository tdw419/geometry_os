; DESCRIPTION: Places a green line segment connecting (499, 7) to (187, 198).
; PLAN: r0=499(x1), r1=7(y1), r2=187(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 7
LDI r2, 187
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
