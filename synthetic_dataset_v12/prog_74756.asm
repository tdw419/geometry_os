; DESCRIPTION: Renders a purple box of size 102x88 starting at (401, 117).
; PLAN: r0=401(x), r1=117(y), r2=102(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 117
LDI r2, 102
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
