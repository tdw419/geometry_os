; DESCRIPTION: Renders a orange box of size 71x73 starting at (260, 66).
; PLAN: r0=260(x), r1=66(y), r2=71(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 66
LDI r2, 71
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
