; DESCRIPTION: Creates a cyan rectangular region at (1, 71) spanning 107 by 76 pixels.
; PLAN: r0=1(x), r1=71(y), r2=107(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 71
LDI r2, 107
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
