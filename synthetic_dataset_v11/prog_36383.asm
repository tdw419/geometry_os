; DESCRIPTION: Creates a yellow rectangular region at (57, 159) spanning 67 by 90 pixels.
; PLAN: r0=57(x), r1=159(y), r2=67(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 159
LDI r2, 67
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
