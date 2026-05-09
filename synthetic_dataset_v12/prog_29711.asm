; DESCRIPTION: Creates a cyan rectangular region at (209, 17) spanning 98 by 82 pixels.
; PLAN: r0=209(x), r1=17(y), r2=98(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 17
LDI r2, 98
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
