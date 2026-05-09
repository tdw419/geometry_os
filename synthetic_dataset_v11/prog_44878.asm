; DESCRIPTION: Composite: . Then Creates a white circular shape at (91, 152) with radius 70. Then Places a yellow line segment connecting (124, 76) to (15, 15).
; PLAN: r0=91(x), r1=152(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=124(x1), r1=76(y1), r2=15(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a white circular shape at (91, 152) with radius 70.
; PLAN: r0=91(x), r1=152(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 152
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow line segment connecting (124, 76) to (15, 15).
; PLAN: r0=124(x1), r1=76(y1), r2=15(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 76
LDI r2, 15
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
