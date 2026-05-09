; DESCRIPTION: Creates a cyan rectangular region at (184, 59) spanning 43 by 17 pixels.
; PLAN: r0=184(x), r1=59(y), r2=43(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 59
LDI r2, 43
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
