; DESCRIPTION: Renders a green box of size 47x59 starting at (11, 185).
; PLAN: r0=11(x), r1=185(y), r2=47(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 185
LDI r2, 47
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
