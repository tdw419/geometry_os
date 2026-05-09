; DESCRIPTION: Renders a magenta box of size 14x16 starting at (217, 217).
; PLAN: r0=217(x), r1=217(y), r2=14(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 217
LDI r2, 14
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
