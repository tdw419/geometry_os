; DESCRIPTION: Creates a cyan rectangular region at (60, 99) spanning 27 by 47 pixels.
; PLAN: r0=60(x), r1=99(y), r2=27(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 99
LDI r2, 27
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
