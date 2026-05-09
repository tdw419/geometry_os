; DESCRIPTION: Renders a white box of size 103x104 starting at (13, 8).
; PLAN: r0=13(x), r1=8(y), r2=103(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 8
LDI r2, 103
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
