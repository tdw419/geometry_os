; DESCRIPTION: Renders a black box of size 96x22 starting at (90, 186).
; PLAN: r0=90(x), r1=186(y), r2=96(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 186
LDI r2, 96
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
