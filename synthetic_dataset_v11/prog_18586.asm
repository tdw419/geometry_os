; DESCRIPTION: Creates a cyan rectangular region at (31, 220) spanning 44 by 28 pixels.
; PLAN: r0=31(x), r1=220(y), r2=44(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 220
LDI r2, 44
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
