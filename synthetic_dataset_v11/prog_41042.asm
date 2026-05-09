; DESCRIPTION: Places a white line segment connecting (209, 173) to (8, 52).
; PLAN: r0=209(x1), r1=173(y1), r2=8(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 173
LDI r2, 8
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
