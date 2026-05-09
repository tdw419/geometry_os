; DESCRIPTION: Renders a orange box of size 39x98 starting at (210, 59).
; PLAN: r0=210(x), r1=59(y), r2=39(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 59
LDI r2, 39
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
