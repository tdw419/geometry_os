; DESCRIPTION: Creates a yellow rectangular region at (215, 31) spanning 24 by 33 pixels.
; PLAN: r0=215(x), r1=31(y), r2=24(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 31
LDI r2, 24
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
