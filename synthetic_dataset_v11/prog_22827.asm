; DESCRIPTION: Renders a green box of size 24x59 starting at (124, 100).
; PLAN: r0=124(x), r1=100(y), r2=24(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 100
LDI r2, 24
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
