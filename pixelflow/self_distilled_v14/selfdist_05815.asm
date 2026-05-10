; DESCRIPTION: Renders a cyan rectangular region spanning 107 by 98 at (139, 39).
; PLAN: r0=139(x), r1=39(y), r2=107(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 39
LDI r2, 107
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
