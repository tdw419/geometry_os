; DESCRIPTION: Renders a orange box of size 18x25 starting at (400, 87).
; PLAN: r0=400(x), r1=87(y), r2=18(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 87
LDI r2, 18
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
