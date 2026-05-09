; DESCRIPTION: Renders a yellow box of size 104x12 starting at (297, 183).
; PLAN: r0=297(x), r1=183(y), r2=104(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 183
LDI r2, 104
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
