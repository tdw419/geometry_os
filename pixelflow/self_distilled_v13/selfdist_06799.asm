; DESCRIPTION: Renders a cyan rectangular region spanning 46 by 57 at (339, 47).
; PLAN: r0=339(x), r1=47(y), r2=46(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 47
LDI r2, 46
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
