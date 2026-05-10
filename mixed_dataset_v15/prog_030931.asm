; DESCRIPTION: Renders a red box of size 89x39 starting at (322, 114).
; PLAN: r0=322(x), r1=114(y), r2=89(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 114
LDI r2, 89
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
