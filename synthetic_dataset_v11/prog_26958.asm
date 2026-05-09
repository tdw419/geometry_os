; DESCRIPTION: Renders a red box of size 110x95 starting at (126, 38).
; PLAN: r0=126(x), r1=38(y), r2=110(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 38
LDI r2, 110
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
