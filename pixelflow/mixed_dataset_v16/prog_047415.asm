; DESCRIPTION: Renders a white box of size 95x17 starting at (406, 179).
; PLAN: r0=406(x), r1=179(y), r2=95(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 179
LDI r2, 95
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
