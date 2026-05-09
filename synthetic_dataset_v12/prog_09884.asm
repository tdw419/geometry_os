; DESCRIPTION: Renders a red box of size 19x46 starting at (482, 45).
; PLAN: r0=482(x), r1=45(y), r2=19(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 45
LDI r2, 19
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
