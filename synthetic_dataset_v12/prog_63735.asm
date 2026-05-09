; DESCRIPTION: Creates a yellow rectangular region at (171, 50) spanning 49 by 86 pixels.
; PLAN: r0=171(x), r1=50(y), r2=49(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 50
LDI r2, 49
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
