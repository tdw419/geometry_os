; DESCRIPTION: Renders a white box of size 89x62 starting at (59, 62).
; PLAN: r0=59(x), r1=62(y), r2=89(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 62
LDI r2, 89
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
