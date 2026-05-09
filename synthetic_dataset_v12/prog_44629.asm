; DESCRIPTION: Renders a black box of size 76x70 starting at (298, 25).
; PLAN: r0=298(x), r1=25(y), r2=76(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 25
LDI r2, 76
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
