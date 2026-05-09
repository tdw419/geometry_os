; DESCRIPTION: Places a orange 24x71 rectangle at position (244, 170).
; PLAN: r0=244(x), r1=170(y), r2=24(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 170
LDI r2, 24
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
