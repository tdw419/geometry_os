; DESCRIPTION: Creates a cyan rectangular region at (194, 111) spanning 102 by 28 pixels.
; PLAN: r0=194(x), r1=111(y), r2=102(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 111
LDI r2, 102
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
