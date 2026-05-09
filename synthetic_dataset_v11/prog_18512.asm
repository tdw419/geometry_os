; DESCRIPTION: Creates a red rectangular region at (107, 94) spanning 82 by 69 pixels.
; PLAN: r0=107(x), r1=94(y), r2=82(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 94
LDI r2, 82
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
