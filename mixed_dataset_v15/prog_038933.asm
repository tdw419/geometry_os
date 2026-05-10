; DESCRIPTION: Renders a red rectangular region spanning 48 by 12 at (6, 68).
; PLAN: r0=6(x), r1=68(y), r2=48(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 68
LDI r2, 48
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
