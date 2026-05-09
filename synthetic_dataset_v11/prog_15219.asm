; DESCRIPTION: Creates a yellow rectangular region at (21, 215) spanning 26 by 32 pixels.
; PLAN: r0=21(x), r1=215(y), r2=26(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 215
LDI r2, 26
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
