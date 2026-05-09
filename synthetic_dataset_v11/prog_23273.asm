; DESCRIPTION: Creates a green rectangular region at (118, 215) spanning 11 by 28 pixels.
; PLAN: r0=118(x), r1=215(y), r2=11(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 215
LDI r2, 11
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
