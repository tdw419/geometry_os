; DESCRIPTION: Renders a magenta box of size 103x107 starting at (30, 126).
; PLAN: r0=30(x), r1=126(y), r2=103(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 126
LDI r2, 103
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
