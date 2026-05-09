; DESCRIPTION: Renders a red box of size 68x62 starting at (370, 97).
; PLAN: r0=370(x), r1=97(y), r2=68(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 97
LDI r2, 68
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
