; DESCRIPTION: Renders a black box of size 112x97 starting at (33, 152).
; PLAN: r0=33(x), r1=152(y), r2=112(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 152
LDI r2, 112
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
