; DESCRIPTION: Renders a black box of size 104x103 starting at (332, 3).
; PLAN: r0=332(x), r1=3(y), r2=104(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 3
LDI r2, 104
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
