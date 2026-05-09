; DESCRIPTION: Composite: . Then Creates a green circular shape at (99, 180) with radius 45. Then Draws a magenta rectangle at (173, 89) with width 79 and height 50.
; PLAN: r0=99(x), r1=180(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=173(x), r1=89(y), r2=79(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a green circular shape at (99, 180) with radius 45.
; PLAN: r0=99(x), r1=180(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 180
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a magenta rectangle at (173, 89) with width 79 and height 50.
; PLAN: r0=173(x), r1=89(y), r2=79(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 89
LDI r2, 79
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
