; DESCRIPTION: Renders a orange box of size 98x73 starting at (195, 29).
; PLAN: r0=195(x), r1=29(y), r2=98(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 29
LDI r2, 98
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
