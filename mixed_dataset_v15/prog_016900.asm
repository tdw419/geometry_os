; DESCRIPTION: Renders a magenta box of size 90x20 starting at (150, 45).
; PLAN: r0=150(x), r1=45(y), r2=90(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 45
LDI r2, 90
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
