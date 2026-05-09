; DESCRIPTION: Creates a yellow rectangular region at (54, 91) spanning 32 by 71 pixels.
; PLAN: r0=54(x), r1=91(y), r2=32(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 91
LDI r2, 32
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
