; DESCRIPTION: Renders a black box of size 46x50 starting at (297, 13).
; PLAN: r0=297(x), r1=13(y), r2=46(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 13
LDI r2, 46
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
