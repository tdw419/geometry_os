; DESCRIPTION: Renders a white box of size 71x34 starting at (208, 32).
; PLAN: r0=208(x), r1=32(y), r2=71(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 32
LDI r2, 71
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
