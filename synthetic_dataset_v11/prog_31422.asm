; DESCRIPTION: Creates a cyan rectangular region at (52, 17) spanning 99 by 93 pixels.
; PLAN: r0=52(x), r1=17(y), r2=99(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 17
LDI r2, 99
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
