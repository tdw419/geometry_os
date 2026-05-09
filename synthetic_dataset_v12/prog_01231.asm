; DESCRIPTION: Renders a black box of size 104x114 starting at (372, 117).
; PLAN: r0=372(x), r1=117(y), r2=104(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 117
LDI r2, 104
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
