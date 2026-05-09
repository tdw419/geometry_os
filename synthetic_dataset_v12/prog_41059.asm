; DESCRIPTION: Creates a cyan rectangular region at (342, 46) spanning 107 by 53 pixels.
; PLAN: r0=342(x), r1=46(y), r2=107(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 46
LDI r2, 107
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
