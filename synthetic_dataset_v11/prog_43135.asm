; DESCRIPTION: Renders a orange box of size 111x98 starting at (63, 137).
; PLAN: r0=63(x), r1=137(y), r2=111(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 137
LDI r2, 111
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
