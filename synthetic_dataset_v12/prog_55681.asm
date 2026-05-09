; DESCRIPTION: Renders a orange box of size 24x117 starting at (391, 10).
; PLAN: r0=391(x), r1=10(y), r2=24(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 10
LDI r2, 24
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
