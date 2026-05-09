; DESCRIPTION: Draws a blue rectangle at (126, 228) with width 64 and height 25.
; PLAN: r0=126(x), r1=228(y), r2=64(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 228
LDI r2, 64
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
