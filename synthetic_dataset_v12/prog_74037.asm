; DESCRIPTION: Renders a orange box of size 60x39 starting at (68, 161).
; PLAN: r0=68(x), r1=161(y), r2=60(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 161
LDI r2, 60
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
