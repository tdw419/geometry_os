; DESCRIPTION: Renders a magenta box of size 71x87 starting at (240, 24).
; PLAN: r0=240(x), r1=24(y), r2=71(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 24
LDI r2, 71
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
