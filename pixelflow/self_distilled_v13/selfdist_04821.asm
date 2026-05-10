; DESCRIPTION: Renders a magenta rectangular region spanning 54 by 16 at (34, 39).
; PLAN: r0=34(x), r1=39(y), r2=54(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 39
LDI r2, 54
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
