; DESCRIPTION: Draws a red rectangle at (126, 111) with width 32 and height 100.
; PLAN: r0=126(x), r1=111(y), r2=32(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 111
LDI r2, 32
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
