; DESCRIPTION: Renders a black box of size 102x15 starting at (340, 213).
; PLAN: r0=340(x), r1=213(y), r2=102(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 213
LDI r2, 102
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
