; DESCRIPTION: Renders a white box of size 35x24 starting at (162, 143).
; PLAN: r0=162(x), r1=143(y), r2=35(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 143
LDI r2, 35
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
