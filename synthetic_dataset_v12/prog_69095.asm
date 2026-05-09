; DESCRIPTION: Renders a magenta box of size 55x30 starting at (85, 126).
; PLAN: r0=85(x), r1=126(y), r2=55(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 126
LDI r2, 55
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
