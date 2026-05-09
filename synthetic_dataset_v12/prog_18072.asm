; DESCRIPTION: Renders a green box of size 62x97 starting at (256, 46).
; PLAN: r0=256(x), r1=46(y), r2=62(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 46
LDI r2, 62
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
