; DESCRIPTION: Renders a orange box of size 22x33 starting at (308, 114).
; PLAN: r0=308(x), r1=114(y), r2=22(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 114
LDI r2, 22
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
