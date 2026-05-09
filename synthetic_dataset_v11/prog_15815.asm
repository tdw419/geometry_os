; DESCRIPTION: Creates a green rectangular region at (4, 195) spanning 67 by 33 pixels.
; PLAN: r0=4(x), r1=195(y), r2=67(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 195
LDI r2, 67
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
