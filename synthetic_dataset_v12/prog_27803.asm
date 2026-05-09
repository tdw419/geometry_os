; DESCRIPTION: Creates a green rectangular region at (313, 67) spanning 113 by 86 pixels.
; PLAN: r0=313(x), r1=67(y), r2=113(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 67
LDI r2, 113
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
