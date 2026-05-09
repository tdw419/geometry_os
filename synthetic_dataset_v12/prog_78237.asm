; DESCRIPTION: Creates a red rectangular region at (82, 198) spanning 73 by 49 pixels.
; PLAN: r0=82(x), r1=198(y), r2=73(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 198
LDI r2, 73
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
