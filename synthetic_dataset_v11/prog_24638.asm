; DESCRIPTION: Creates a white rectangular region at (133, 91) spanning 67 by 47 pixels.
; PLAN: r0=133(x), r1=91(y), r2=67(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 91
LDI r2, 67
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
