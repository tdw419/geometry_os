; DESCRIPTION: Renders a black box of size 16x50 starting at (106, 170).
; PLAN: r0=106(x), r1=170(y), r2=16(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 170
LDI r2, 16
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
