; DESCRIPTION: Renders a white box of size 55x24 starting at (208, 40).
; PLAN: r0=208(x), r1=40(y), r2=55(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 40
LDI r2, 55
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
