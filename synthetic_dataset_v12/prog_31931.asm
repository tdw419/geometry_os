; DESCRIPTION: Renders a orange box of size 40x50 starting at (125, 83).
; PLAN: r0=125(x), r1=83(y), r2=40(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 83
LDI r2, 40
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
