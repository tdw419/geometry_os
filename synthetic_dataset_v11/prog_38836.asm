; DESCRIPTION: Composite: . Then Draws a orange circle centered at (112, 154) with radius 76. Then Places a orange 106x20 rectangle at position (89, 133).
; PLAN: r0=112(x), r1=154(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=89(x), r1=133(y), r2=106(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (112, 154) with radius 76.
; PLAN: r0=112(x), r1=154(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 154
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange 106x20 rectangle at position (89, 133).
; PLAN: r0=89(x), r1=133(y), r2=106(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 133
LDI r2, 106
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
