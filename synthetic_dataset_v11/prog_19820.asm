; DESCRIPTION: Renders a green box of size 76x49 starting at (59, 131).
; PLAN: r0=59(x), r1=131(y), r2=76(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 131
LDI r2, 76
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
