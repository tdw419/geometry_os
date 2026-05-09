; DESCRIPTION: Renders a orange box of size 36x10 starting at (226, 103).
; PLAN: r0=226(x), r1=103(y), r2=36(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 103
LDI r2, 36
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
