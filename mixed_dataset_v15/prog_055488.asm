; DESCRIPTION: Renders a white box of size 90x34 starting at (177, 103).
; PLAN: r0=177(x), r1=103(y), r2=90(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 103
LDI r2, 90
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
