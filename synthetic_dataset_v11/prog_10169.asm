; DESCRIPTION: Composite: . Then Creates a orange circular shape at (113, 189) with radius 13. Then Renders a white box of size 16x91 starting at (8, 50).
; PLAN: r0=113(x), r1=189(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=8(x), r1=50(y), r2=16(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange circular shape at (113, 189) with radius 13.
; PLAN: r0=113(x), r1=189(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 189
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a white box of size 16x91 starting at (8, 50).
; PLAN: r0=8(x), r1=50(y), r2=16(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 50
LDI r2, 16
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
