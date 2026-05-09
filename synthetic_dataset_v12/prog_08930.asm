; DESCRIPTION: Renders a orange box of size 111x49 starting at (89, 174).
; PLAN: r0=89(x), r1=174(y), r2=111(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 174
LDI r2, 111
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
