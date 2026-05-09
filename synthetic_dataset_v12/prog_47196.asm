; DESCRIPTION: Renders a white box of size 104x21 starting at (174, 91).
; PLAN: r0=174(x), r1=91(y), r2=104(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 91
LDI r2, 104
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
