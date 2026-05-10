; DESCRIPTION: Renders a orange box of size 33x65 starting at (386, 105).
; PLAN: r0=386(x), r1=105(y), r2=33(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 105
LDI r2, 33
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
