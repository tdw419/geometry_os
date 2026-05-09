; DESCRIPTION: Renders a green box of size 33x16 starting at (181, 136).
; PLAN: r0=181(x), r1=136(y), r2=33(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 136
LDI r2, 33
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
