; DESCRIPTION: Renders a white box of size 22x62 starting at (1, 61).
; PLAN: r0=1(x), r1=61(y), r2=22(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 61
LDI r2, 22
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
