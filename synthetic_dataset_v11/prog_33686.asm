; DESCRIPTION: Renders a black box of size 106x30 starting at (8, 195).
; PLAN: r0=8(x), r1=195(y), r2=106(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 195
LDI r2, 106
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
