; DESCRIPTION: Renders a white box of size 104x60 starting at (372, 154).
; PLAN: r0=372(x), r1=154(y), r2=104(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 154
LDI r2, 104
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
