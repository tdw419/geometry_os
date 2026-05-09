; DESCRIPTION: Renders a green box of size 105x97 starting at (384, 124).
; PLAN: r0=384(x), r1=124(y), r2=105(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 124
LDI r2, 105
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
