; DESCRIPTION: Renders a blue box of size 42x100 starting at (413, 103).
; PLAN: r0=413(x), r1=103(y), r2=42(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 103
LDI r2, 42
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
