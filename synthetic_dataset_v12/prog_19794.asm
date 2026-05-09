; DESCRIPTION: Renders a red box of size 21x88 starting at (193, 149).
; PLAN: r0=193(x), r1=149(y), r2=21(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 149
LDI r2, 21
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
