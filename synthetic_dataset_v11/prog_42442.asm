; DESCRIPTION: Creates a yellow rectangular region at (21, 175) spanning 45 by 61 pixels.
; PLAN: r0=21(x), r1=175(y), r2=45(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 175
LDI r2, 45
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
