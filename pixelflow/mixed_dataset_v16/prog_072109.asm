; DESCRIPTION: Renders a black box of size 104x109 starting at (300, 104).
; PLAN: r0=300(x), r1=104(y), r2=104(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 104
LDI r2, 104
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
