; DESCRIPTION: Creates a yellow rectangular region at (374, 20) spanning 86 by 24 pixels.
; PLAN: r0=374(x), r1=20(y), r2=86(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 20
LDI r2, 86
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
