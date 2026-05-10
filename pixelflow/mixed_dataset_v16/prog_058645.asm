; DESCRIPTION: Renders a orange box of size 86x74 starting at (270, 103).
; PLAN: r0=270(x), r1=103(y), r2=86(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 103
LDI r2, 86
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
