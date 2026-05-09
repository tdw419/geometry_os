; DESCRIPTION: Creates a yellow rectangular region at (239, 117) spanning 28 by 82 pixels.
; PLAN: r0=239(x), r1=117(y), r2=28(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 117
LDI r2, 28
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
