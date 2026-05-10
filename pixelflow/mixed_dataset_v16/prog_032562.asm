; DESCRIPTION: Draws a white rectangle at (394, 45) with width 37 and height 95.
; PLAN: r0=394(x), r1=45(y), r2=37(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 45
LDI r2, 37
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
