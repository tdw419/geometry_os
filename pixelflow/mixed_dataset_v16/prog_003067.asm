; DESCRIPTION: Creates a yellow rectangular region at (413, 65) spanning 39 by 116 pixels.
; PLAN: r0=413(x), r1=65(y), r2=39(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 65
LDI r2, 39
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
