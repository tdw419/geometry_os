; DESCRIPTION: Renders a black box of size 117x14 starting at (340, 86).
; PLAN: r0=340(x), r1=86(y), r2=117(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 86
LDI r2, 117
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
