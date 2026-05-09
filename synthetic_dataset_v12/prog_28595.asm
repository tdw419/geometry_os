; DESCRIPTION: Renders a orange box of size 106x98 starting at (389, 66).
; PLAN: r0=389(x), r1=66(y), r2=106(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 66
LDI r2, 106
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
