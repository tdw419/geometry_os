; DESCRIPTION: Renders a orange box of size 111x66 starting at (7, 59).
; PLAN: r0=7(x), r1=59(y), r2=111(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 59
LDI r2, 111
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
