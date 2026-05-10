; DESCRIPTION: Renders a orange box of size 86x21 starting at (267, 74).
; PLAN: r0=267(x), r1=74(y), r2=86(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 74
LDI r2, 86
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
