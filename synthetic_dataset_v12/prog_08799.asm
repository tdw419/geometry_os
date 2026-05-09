; DESCRIPTION: Renders a green box of size 28x13 starting at (187, 136).
; PLAN: r0=187(x), r1=136(y), r2=28(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 136
LDI r2, 28
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
