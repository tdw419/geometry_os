; DESCRIPTION: Renders a magenta box of size 43x104 starting at (21, 12).
; PLAN: r0=21(x), r1=12(y), r2=43(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 12
LDI r2, 43
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
