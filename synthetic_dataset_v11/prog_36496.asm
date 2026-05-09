; DESCRIPTION: Composite: . Then Places a orange 87x120 rectangle at position (162, 33). Then Draws a yellow circle centered at (189, 110) with radius 66.
; PLAN: r0=162(x), r1=33(y), r2=87(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=189(x), r1=110(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange 87x120 rectangle at position (162, 33).
; PLAN: r0=162(x), r1=33(y), r2=87(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 33
LDI r2, 87
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow circle centered at (189, 110) with radius 66.
; PLAN: r0=189(x), r1=110(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 110
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
