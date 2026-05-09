; DESCRIPTION: Renders a magenta box of size 50x20 starting at (21, 141).
; PLAN: r0=21(x), r1=141(y), r2=50(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 141
LDI r2, 50
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
