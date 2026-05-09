; DESCRIPTION: Renders a black box of size 38x25 starting at (295, 69).
; PLAN: r0=295(x), r1=69(y), r2=38(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 69
LDI r2, 38
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
