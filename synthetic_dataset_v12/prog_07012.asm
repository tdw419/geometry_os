; DESCRIPTION: Creates a cyan rectangular region at (306, 39) spanning 112 by 12 pixels.
; PLAN: r0=306(x), r1=39(y), r2=112(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 39
LDI r2, 112
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
