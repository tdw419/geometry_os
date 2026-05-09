; DESCRIPTION: Renders a magenta box of size 16x49 starting at (10, 207).
; PLAN: r0=10(x), r1=207(y), r2=16(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 207
LDI r2, 16
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
