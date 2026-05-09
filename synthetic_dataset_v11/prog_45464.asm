; DESCRIPTION: Renders a white box of size 21x96 starting at (202, 129).
; PLAN: r0=202(x), r1=129(y), r2=21(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 129
LDI r2, 21
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
