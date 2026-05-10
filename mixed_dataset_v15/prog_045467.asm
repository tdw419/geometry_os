; DESCRIPTION: Renders a orange box of size 86x87 starting at (35, 134).
; PLAN: r0=35(x), r1=134(y), r2=86(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 134
LDI r2, 86
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
