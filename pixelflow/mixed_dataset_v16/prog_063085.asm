; DESCRIPTION: Renders a blue box of size 94x42 starting at (316, 30).
; PLAN: r0=316(x), r1=30(y), r2=94(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 30
LDI r2, 94
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
