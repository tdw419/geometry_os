; DESCRIPTION: Renders a magenta box of size 83x95 starting at (163, 29).
; PLAN: r0=163(x), r1=29(y), r2=83(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 29
LDI r2, 83
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
