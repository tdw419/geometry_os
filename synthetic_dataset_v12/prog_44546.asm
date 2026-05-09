; DESCRIPTION: Renders a black box of size 68x25 starting at (67, 192).
; PLAN: r0=67(x), r1=192(y), r2=68(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 192
LDI r2, 68
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
