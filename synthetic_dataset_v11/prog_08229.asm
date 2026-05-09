; DESCRIPTION: Renders a white box of size 95x102 starting at (24, 127).
; PLAN: r0=24(x), r1=127(y), r2=95(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 127
LDI r2, 95
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
