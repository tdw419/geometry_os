; DESCRIPTION: Creates a cyan rectangular region at (106, 18) spanning 27 by 93 pixels.
; PLAN: r0=106(x), r1=18(y), r2=27(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 18
LDI r2, 27
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
