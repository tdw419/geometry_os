; DESCRIPTION: Renders a orange box of size 13x94 starting at (39, 141).
; PLAN: r0=39(x), r1=141(y), r2=13(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 141
LDI r2, 13
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
