; DESCRIPTION: Renders a red rectangular region spanning 40 by 23 at (156, 55).
; PLAN: r0=156(x), r1=55(y), r2=40(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 55
LDI r2, 40
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
