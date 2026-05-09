; DESCRIPTION: Places a red 62x55 rectangle at position (157, 199).
; PLAN: r0=157(x), r1=199(y), r2=62(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 199
LDI r2, 62
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
