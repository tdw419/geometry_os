; DESCRIPTION: Creates a red rectangular region at (327, 43) spanning 53 by 47 pixels.
; PLAN: r0=327(x), r1=43(y), r2=53(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 43
LDI r2, 53
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
