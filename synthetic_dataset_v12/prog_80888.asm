; DESCRIPTION: Renders a magenta box of size 74x104 starting at (7, 27).
; PLAN: r0=7(x), r1=27(y), r2=74(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 27
LDI r2, 74
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
