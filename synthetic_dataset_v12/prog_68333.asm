; DESCRIPTION: Renders a red box of size 18x59 starting at (5, 196).
; PLAN: r0=5(x), r1=196(y), r2=18(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 196
LDI r2, 18
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
