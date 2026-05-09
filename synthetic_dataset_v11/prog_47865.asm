; DESCRIPTION: Draws a magenta rectangle at (21, 164) with width 109 and height 27.
; PLAN: r0=21(x), r1=164(y), r2=109(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 164
LDI r2, 109
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
