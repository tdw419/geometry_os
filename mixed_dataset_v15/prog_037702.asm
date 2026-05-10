; DESCRIPTION: Renders a orange box of size 108x59 starting at (229, 84).
; PLAN: r0=229(x), r1=84(y), r2=108(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 84
LDI r2, 108
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
