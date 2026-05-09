; DESCRIPTION: Renders a black box of size 19x49 starting at (401, 63).
; PLAN: r0=401(x), r1=63(y), r2=19(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 63
LDI r2, 19
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
