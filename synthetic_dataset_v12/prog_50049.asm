; DESCRIPTION: Renders a magenta box of size 92x21 starting at (87, 5).
; PLAN: r0=87(x), r1=5(y), r2=92(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 5
LDI r2, 92
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
