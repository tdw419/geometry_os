; DESCRIPTION: Creates a white rectangular region at (202, 12) spanning 17 by 13 pixels.
; PLAN: r0=202(x), r1=12(y), r2=17(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 12
LDI r2, 17
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
