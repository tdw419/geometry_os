; DESCRIPTION: Renders a magenta box of size 101x54 starting at (301, 76).
; PLAN: r0=301(x), r1=76(y), r2=101(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 76
LDI r2, 101
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
