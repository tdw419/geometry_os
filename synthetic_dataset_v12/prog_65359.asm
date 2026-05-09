; DESCRIPTION: Draws a magenta rectangle at (362, 152) with width 48 and height 32.
; PLAN: r0=362(x), r1=152(y), r2=48(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 152
LDI r2, 48
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
