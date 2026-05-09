; DESCRIPTION: Renders a black box of size 16x59 starting at (406, 185).
; PLAN: r0=406(x), r1=185(y), r2=16(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 185
LDI r2, 16
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
