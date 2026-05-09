; DESCRIPTION: Renders a green box of size 59x92 starting at (270, 13).
; PLAN: r0=270(x), r1=13(y), r2=59(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 13
LDI r2, 59
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
