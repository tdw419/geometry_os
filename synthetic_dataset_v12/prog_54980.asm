; DESCRIPTION: Renders a magenta box of size 45x74 starting at (115, 27).
; PLAN: r0=115(x), r1=27(y), r2=45(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 27
LDI r2, 45
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
