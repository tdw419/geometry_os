; DESCRIPTION: Draws a magenta rectangle at (245, 64) with width 93 and height 93.
; PLAN: r0=245(x), r1=64(y), r2=93(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 64
LDI r2, 93
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
