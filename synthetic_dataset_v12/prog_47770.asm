; DESCRIPTION: Renders a magenta box of size 22x39 starting at (149, 157).
; PLAN: r0=149(x), r1=157(y), r2=22(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 157
LDI r2, 22
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
