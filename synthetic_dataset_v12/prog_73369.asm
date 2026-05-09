; DESCRIPTION: Creates a cyan rectangular region at (340, 46) spanning 52 by 93 pixels.
; PLAN: r0=340(x), r1=46(y), r2=52(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 46
LDI r2, 52
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
