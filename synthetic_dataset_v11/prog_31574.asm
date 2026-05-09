; DESCRIPTION: Renders a black box of size 48x74 starting at (117, 9).
; PLAN: r0=117(x), r1=9(y), r2=48(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 9
LDI r2, 48
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
