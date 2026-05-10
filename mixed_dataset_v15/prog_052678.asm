; DESCRIPTION: Renders a orange box of size 83x11 starting at (124, 210).
; PLAN: r0=124(x), r1=210(y), r2=83(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 210
LDI r2, 83
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
