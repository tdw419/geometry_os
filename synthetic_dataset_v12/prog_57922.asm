; DESCRIPTION: Creates a yellow rectangular region at (206, 67) spanning 47 by 91 pixels.
; PLAN: r0=206(x), r1=67(y), r2=47(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 67
LDI r2, 47
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
