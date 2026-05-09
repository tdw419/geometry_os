; DESCRIPTION: Renders a white box of size 66x38 starting at (226, 162).
; PLAN: r0=226(x), r1=162(y), r2=66(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 162
LDI r2, 66
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
