; DESCRIPTION: Renders a red box of size 120x31 starting at (225, 62).
; PLAN: r0=225(x), r1=62(y), r2=120(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 62
LDI r2, 120
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
