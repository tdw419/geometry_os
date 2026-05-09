; DESCRIPTION: Creates a cyan rectangular region at (166, 16) spanning 33 by 38 pixels.
; PLAN: r0=166(x), r1=16(y), r2=33(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 16
LDI r2, 33
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
