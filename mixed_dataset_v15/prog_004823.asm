; DESCRIPTION: Renders a magenta rectangular region spanning 68 by 33 at (184, 89).
; PLAN: r0=184(x), r1=89(y), r2=68(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 89
LDI r2, 68
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
