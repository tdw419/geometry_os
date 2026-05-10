; DESCRIPTION: Creates a yellow rectangular region at (91, 240) spanning 86 by 16 pixels.
; PLAN: r0=91(x), r1=240(y), r2=86(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 240
LDI r2, 86
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
