; DESCRIPTION: Renders a red box of size 22x75 starting at (244, 0).
; PLAN: r0=244(x), r1=0(y), r2=22(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 0
LDI r2, 22
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
