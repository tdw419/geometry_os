; DESCRIPTION: Renders a red box of size 65x39 starting at (120, 184).
; PLAN: r0=120(x), r1=184(y), r2=65(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 184
LDI r2, 65
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
