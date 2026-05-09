; DESCRIPTION: Renders a green box of size 36x68 starting at (344, 136).
; PLAN: r0=344(x), r1=136(y), r2=36(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 136
LDI r2, 36
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
