; DESCRIPTION: Creates a cyan rectangular region at (388, 209) spanning 117 by 43 pixels.
; PLAN: r0=388(x), r1=209(y), r2=117(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 209
LDI r2, 117
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
