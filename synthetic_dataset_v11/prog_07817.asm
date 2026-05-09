; DESCRIPTION: Renders a magenta box of size 86x50 starting at (121, 45).
; PLAN: r0=121(x), r1=45(y), r2=86(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 45
LDI r2, 86
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
