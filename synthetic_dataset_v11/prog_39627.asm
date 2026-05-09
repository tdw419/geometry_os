; DESCRIPTION: Creates a yellow rectangular region at (54, 142) spanning 27 by 38 pixels.
; PLAN: r0=54(x), r1=142(y), r2=27(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 142
LDI r2, 27
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
