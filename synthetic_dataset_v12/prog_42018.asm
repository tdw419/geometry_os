; DESCRIPTION: Renders a orange box of size 81x11 starting at (215, 206).
; PLAN: r0=215(x), r1=206(y), r2=81(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 206
LDI r2, 81
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
