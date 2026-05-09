; DESCRIPTION: Places a white line segment connecting (209, 151) to (499, 216).
; PLAN: r0=209(x1), r1=151(y1), r2=499(x2), r3=216(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 151
LDI r2, 499
LDI r3, 216
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
