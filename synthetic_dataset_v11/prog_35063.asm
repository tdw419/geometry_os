; DESCRIPTION: Renders a white box of size 20x12 starting at (166, 174).
; PLAN: r0=166(x), r1=174(y), r2=20(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 174
LDI r2, 20
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
