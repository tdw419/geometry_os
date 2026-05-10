; DESCRIPTION: Creates a cyan rectangular region at (253, 40) spanning 24 by 32 pixels.
; PLAN: r0=253(x), r1=40(y), r2=24(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 40
LDI r2, 24
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
