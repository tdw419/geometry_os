; DESCRIPTION: Creates a cyan rectangular region at (178, 68) spanning 71 by 69 pixels.
; PLAN: r0=178(x), r1=68(y), r2=71(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 68
LDI r2, 71
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
