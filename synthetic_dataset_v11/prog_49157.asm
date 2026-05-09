; DESCRIPTION: Renders a red box of size 53x91 starting at (33, 59).
; PLAN: r0=33(x), r1=59(y), r2=53(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 59
LDI r2, 53
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
