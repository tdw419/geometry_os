; DESCRIPTION: Places a white line segment connecting (84, 173) to (173, 0).
; PLAN: r0=84(x1), r1=173(y1), r2=173(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 173
LDI r2, 173
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
