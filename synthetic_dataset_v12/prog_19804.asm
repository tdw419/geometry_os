; DESCRIPTION: Renders a red box of size 69x45 starting at (124, 40).
; PLAN: r0=124(x), r1=40(y), r2=69(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 40
LDI r2, 69
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
