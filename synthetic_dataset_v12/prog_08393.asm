; DESCRIPTION: Renders a magenta box of size 50x52 starting at (416, 100).
; PLAN: r0=416(x), r1=100(y), r2=50(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 100
LDI r2, 50
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
