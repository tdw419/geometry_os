; DESCRIPTION: Creates a cyan rectangular region at (134, 197) spanning 49 by 43 pixels.
; PLAN: r0=134(x), r1=197(y), r2=49(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 197
LDI r2, 49
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
