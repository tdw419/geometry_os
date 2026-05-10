; DESCRIPTION: Renders a cyan rectangular region spanning 98 by 84 at (364, 153).
; PLAN: r0=364(x), r1=153(y), r2=98(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 153
LDI r2, 98
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
