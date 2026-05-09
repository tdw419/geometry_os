; DESCRIPTION: Places a yellow line segment connecting (76, 244) to (173, 91).
; PLAN: r0=76(x1), r1=244(y1), r2=173(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 244
LDI r2, 173
LDI r3, 91
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
