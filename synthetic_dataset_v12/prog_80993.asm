; DESCRIPTION: Renders a blue box of size 12x91 starting at (401, 9).
; PLAN: r0=401(x), r1=9(y), r2=12(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 9
LDI r2, 12
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
