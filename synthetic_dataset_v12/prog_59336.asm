; DESCRIPTION: Creates a cyan rectangular region at (435, 43) spanning 19 by 92 pixels.
; PLAN: r0=435(x), r1=43(y), r2=19(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 43
LDI r2, 19
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
