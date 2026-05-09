; DESCRIPTION: Renders a white box of size 20x73 starting at (284, 91).
; PLAN: r0=284(x), r1=91(y), r2=20(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 91
LDI r2, 20
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
