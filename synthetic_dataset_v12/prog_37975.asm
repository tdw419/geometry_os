; DESCRIPTION: Renders a magenta box of size 54x120 starting at (318, 95).
; PLAN: r0=318(x), r1=95(y), r2=54(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 95
LDI r2, 54
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
