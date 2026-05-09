; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (165, 224) to (143, 87). Then Draws a yellow circle centered at (138, 173) with radius 45.
; PLAN: r0=165(x1), r1=224(y1), r2=143(x2), r3=87(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=138(x), r1=173(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow line segment connecting (165, 224) to (143, 87).
; PLAN: r0=165(x1), r1=224(y1), r2=143(x2), r3=87(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 224
LDI r2, 143
LDI r3, 87
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow circle centered at (138, 173) with radius 45.
; PLAN: r0=138(x), r1=173(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 173
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
