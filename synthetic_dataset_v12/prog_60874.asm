; DESCRIPTION: Renders a green box of size 66x40 starting at (172, 59).
; PLAN: r0=172(x), r1=59(y), r2=66(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 59
LDI r2, 66
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
