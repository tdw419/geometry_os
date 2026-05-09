; DESCRIPTION: Creates a cyan rectangular region at (27, 77) spanning 14 by 46 pixels.
; PLAN: r0=27(x), r1=77(y), r2=14(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 77
LDI r2, 14
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
