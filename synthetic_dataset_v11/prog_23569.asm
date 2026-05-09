; DESCRIPTION: Composite: . Then Creates a white circular shape at (77, 116) with radius 64. Then Places a yellow line segment connecting (149, 124) to (87, 62).
; PLAN: r0=77(x), r1=116(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=149(x1), r1=124(y1), r2=87(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a white circular shape at (77, 116) with radius 64.
; PLAN: r0=77(x), r1=116(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 116
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow line segment connecting (149, 124) to (87, 62).
; PLAN: r0=149(x1), r1=124(y1), r2=87(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 124
LDI r2, 87
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
