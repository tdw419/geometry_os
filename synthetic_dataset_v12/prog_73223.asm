; DESCRIPTION: Creates a cyan rectangular region at (238, 174) spanning 28 by 33 pixels.
; PLAN: r0=238(x), r1=174(y), r2=28(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 174
LDI r2, 28
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
