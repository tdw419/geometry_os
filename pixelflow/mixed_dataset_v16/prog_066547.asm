; DESCRIPTION: Renders a green rectangular region spanning 104 by 24 at (284, 119).
; PLAN: r0=284(x), r1=119(y), r2=104(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 119
LDI r2, 104
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
