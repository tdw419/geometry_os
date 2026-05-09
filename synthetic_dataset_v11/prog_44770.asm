; DESCRIPTION: Renders a white box of size 95x113 starting at (74, 40).
; PLAN: r0=74(x), r1=40(y), r2=95(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 40
LDI r2, 95
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
