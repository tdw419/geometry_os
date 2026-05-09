; DESCRIPTION: Renders a white box of size 47x15 starting at (3, 225).
; PLAN: r0=3(x), r1=225(y), r2=47(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 225
LDI r2, 47
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
