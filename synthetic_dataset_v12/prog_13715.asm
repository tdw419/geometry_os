; DESCRIPTION: Renders a orange box of size 111x97 starting at (401, 99).
; PLAN: r0=401(x), r1=99(y), r2=111(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 99
LDI r2, 111
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
