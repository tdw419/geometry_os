; DESCRIPTION: Creates a cyan rectangular region at (27, 1) spanning 18 by 58 pixels.
; PLAN: r0=27(x), r1=1(y), r2=18(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 1
LDI r2, 18
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
