; DESCRIPTION: Renders a white box of size 24x22 starting at (95, 21).
; PLAN: r0=95(x), r1=21(y), r2=24(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 21
LDI r2, 24
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
