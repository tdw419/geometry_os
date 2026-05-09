; DESCRIPTION: Renders a orange box of size 89x74 starting at (18, 109).
; PLAN: r0=18(x), r1=109(y), r2=89(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 109
LDI r2, 89
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
