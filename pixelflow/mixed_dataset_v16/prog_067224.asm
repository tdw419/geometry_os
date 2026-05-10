; DESCRIPTION: Renders a red rectangular region spanning 79 by 91 at (81, 31).
; PLAN: r0=81(x), r1=31(y), r2=79(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 31
LDI r2, 79
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
