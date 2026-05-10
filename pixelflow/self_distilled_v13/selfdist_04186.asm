; DESCRIPTION: Renders a cyan rectangular region spanning 75 by 55 at (354, 78).
; PLAN: r0=354(x), r1=78(y), r2=75(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 78
LDI r2, 75
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
