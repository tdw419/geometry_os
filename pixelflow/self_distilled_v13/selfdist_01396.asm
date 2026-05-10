; DESCRIPTION: Renders a cyan rectangular region spanning 93 by 56 at (114, 110).
; PLAN: r0=114(x), r1=110(y), r2=93(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 110
LDI r2, 93
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
