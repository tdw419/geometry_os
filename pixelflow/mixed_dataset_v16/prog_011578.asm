; DESCRIPTION: Renders a orange box of size 18x36 starting at (475, 103).
; PLAN: r0=475(x), r1=103(y), r2=18(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 103
LDI r2, 18
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
