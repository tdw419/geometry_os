; DESCRIPTION: Creates a red rectangular region at (113, 43) spanning 67 by 16 pixels.
; PLAN: r0=113(x), r1=43(y), r2=67(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 43
LDI r2, 67
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
