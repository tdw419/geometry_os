; DESCRIPTION: Renders a cyan rectangular region spanning 68 by 101 at (212, 9).
; PLAN: r0=212(x), r1=9(y), r2=68(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 9
LDI r2, 68
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
