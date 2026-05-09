; DESCRIPTION: Creates a red rectangular region at (82, 43) spanning 77 by 67 pixels.
; PLAN: r0=82(x), r1=43(y), r2=77(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 43
LDI r2, 77
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
