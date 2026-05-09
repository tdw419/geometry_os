; DESCRIPTION: Renders a black box of size 112x67 starting at (135, 91).
; PLAN: r0=135(x), r1=91(y), r2=112(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 91
LDI r2, 112
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
