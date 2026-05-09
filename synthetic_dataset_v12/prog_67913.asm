; DESCRIPTION: Draws a magenta rectangle at (379, 129) with width 62 and height 90.
; PLAN: r0=379(x), r1=129(y), r2=62(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 129
LDI r2, 62
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
