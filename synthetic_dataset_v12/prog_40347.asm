; DESCRIPTION: Renders a red box of size 106x100 starting at (401, 69).
; PLAN: r0=401(x), r1=69(y), r2=106(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 69
LDI r2, 106
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
