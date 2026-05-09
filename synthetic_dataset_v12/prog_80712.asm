; DESCRIPTION: Renders a red box of size 89x67 starting at (225, 167).
; PLAN: r0=225(x), r1=167(y), r2=89(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 167
LDI r2, 89
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
