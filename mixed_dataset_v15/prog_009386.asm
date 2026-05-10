; DESCRIPTION: Renders a red box of size 89x62 starting at (281, 123).
; PLAN: r0=281(x), r1=123(y), r2=89(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 123
LDI r2, 89
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
