; DESCRIPTION: Renders a orange box of size 63x76 starting at (262, 175).
; PLAN: r0=262(x), r1=175(y), r2=63(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 175
LDI r2, 63
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
