; DESCRIPTION: Renders a white box of size 39x59 starting at (105, 138).
; PLAN: r0=105(x), r1=138(y), r2=39(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 138
LDI r2, 39
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
