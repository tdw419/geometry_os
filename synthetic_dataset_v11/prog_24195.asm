; DESCRIPTION: Renders a black box of size 104x20 starting at (141, 117).
; PLAN: r0=141(x), r1=117(y), r2=104(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 117
LDI r2, 104
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
