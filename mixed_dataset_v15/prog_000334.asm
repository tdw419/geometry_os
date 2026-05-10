; DESCRIPTION: Renders a red box of size 12x35 starting at (326, 187).
; PLAN: r0=326(x), r1=187(y), r2=12(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 187
LDI r2, 12
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
