; DESCRIPTION: Renders a magenta box of size 54x30 starting at (260, 68).
; PLAN: r0=260(x), r1=68(y), r2=54(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 68
LDI r2, 54
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
