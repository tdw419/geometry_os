; DESCRIPTION: Creates a purple rectangular region at (246, 225) spanning 33 by 28 pixels.
; PLAN: r0=246(x), r1=225(y), r2=33(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 225
LDI r2, 33
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
