; DESCRIPTION: Renders a yellow box of size 104x74 starting at (6, 131).
; PLAN: r0=6(x), r1=131(y), r2=104(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 131
LDI r2, 104
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
