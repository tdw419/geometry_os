; DESCRIPTION: Renders a red box of size 19x50 starting at (492, 187).
; PLAN: r0=492(x), r1=187(y), r2=19(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 187
LDI r2, 19
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
