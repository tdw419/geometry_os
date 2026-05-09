; DESCRIPTION: Renders a orange box of size 99x24 starting at (116, 225).
; PLAN: r0=116(x), r1=225(y), r2=99(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 225
LDI r2, 99
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
