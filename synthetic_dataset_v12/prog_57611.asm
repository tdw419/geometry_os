; DESCRIPTION: Renders a orange box of size 20x23 starting at (122, 215).
; PLAN: r0=122(x), r1=215(y), r2=20(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 215
LDI r2, 20
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
