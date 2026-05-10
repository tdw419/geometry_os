; DESCRIPTION: Renders a magenta rectangular region spanning 83 by 65 at (55, 93).
; PLAN: r0=55(x), r1=93(y), r2=83(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 93
LDI r2, 83
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
