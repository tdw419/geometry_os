; DESCRIPTION: Renders a white box of size 52x59 starting at (7, 182).
; PLAN: r0=7(x), r1=182(y), r2=52(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 182
LDI r2, 52
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
