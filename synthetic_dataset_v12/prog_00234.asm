; DESCRIPTION: Creates a cyan rectangular region at (211, 146) spanning 119 by 107 pixels.
; PLAN: r0=211(x), r1=146(y), r2=119(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 146
LDI r2, 119
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
