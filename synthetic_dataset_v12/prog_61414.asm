; DESCRIPTION: Creates a cyan rectangular region at (71, 140) spanning 107 by 31 pixels.
; PLAN: r0=71(x), r1=140(y), r2=107(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 140
LDI r2, 107
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
