; DESCRIPTION: Renders a white box of size 95x45 starting at (34, 209).
; PLAN: r0=34(x), r1=209(y), r2=95(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 209
LDI r2, 95
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
