; DESCRIPTION: Creates a cyan rectangular region at (39, 94) spanning 91 by 69 pixels.
; PLAN: r0=39(x), r1=94(y), r2=91(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 94
LDI r2, 91
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
