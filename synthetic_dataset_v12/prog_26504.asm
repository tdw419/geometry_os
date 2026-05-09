; DESCRIPTION: Creates a red rectangular region at (326, 5) spanning 76 by 81 pixels.
; PLAN: r0=326(x), r1=5(y), r2=76(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 5
LDI r2, 76
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
