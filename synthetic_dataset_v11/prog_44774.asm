; DESCRIPTION: Renders a black box of size 55x37 starting at (25, 186).
; PLAN: r0=25(x), r1=186(y), r2=55(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 186
LDI r2, 55
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
