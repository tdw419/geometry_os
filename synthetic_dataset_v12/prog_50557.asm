; DESCRIPTION: Creates a red rectangular region at (208, 17) spanning 83 by 39 pixels.
; PLAN: r0=208(x), r1=17(y), r2=83(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 17
LDI r2, 83
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
