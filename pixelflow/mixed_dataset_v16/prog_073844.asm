; DESCRIPTION: Creates a green rectangular region at (157, 215) spanning 86 by 22 pixels.
; PLAN: r0=157(x), r1=215(y), r2=86(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 215
LDI r2, 86
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
