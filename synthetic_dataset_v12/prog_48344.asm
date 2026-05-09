; DESCRIPTION: Renders a purple box of size 22x100 starting at (156, 38).
; PLAN: r0=156(x), r1=38(y), r2=22(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 38
LDI r2, 22
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
