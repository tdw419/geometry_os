; DESCRIPTION: Creates a cyan rectangular region at (134, 23) spanning 109 by 39 pixels.
; PLAN: r0=134(x), r1=23(y), r2=109(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 23
LDI r2, 109
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
