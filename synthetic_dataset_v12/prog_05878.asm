; DESCRIPTION: Renders a orange box of size 30x117 starting at (111, 109).
; PLAN: r0=111(x), r1=109(y), r2=30(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 109
LDI r2, 30
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
