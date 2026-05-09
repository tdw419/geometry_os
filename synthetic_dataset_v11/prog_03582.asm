; DESCRIPTION: Draws a magenta rectangle at (32, 182) with width 57 and height 72.
; PLAN: r0=32(x), r1=182(y), r2=57(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 182
LDI r2, 57
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
