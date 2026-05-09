; DESCRIPTION: Places a magenta 85x40 rectangle at position (17, 211).
; PLAN: r0=17(x), r1=211(y), r2=85(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 211
LDI r2, 85
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
