; DESCRIPTION: Creates a cyan rectangular region at (18, 107) spanning 17 by 19 pixels.
; PLAN: r0=18(x), r1=107(y), r2=17(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 107
LDI r2, 17
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
