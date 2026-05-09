; DESCRIPTION: Creates a cyan rectangular region at (39, 151) spanning 69 by 26 pixels.
; PLAN: r0=39(x), r1=151(y), r2=69(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 151
LDI r2, 69
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
