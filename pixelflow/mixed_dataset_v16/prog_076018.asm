; DESCRIPTION: Renders a green box of size 24x16 starting at (289, 175).
; PLAN: r0=289(x), r1=175(y), r2=24(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 175
LDI r2, 24
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
