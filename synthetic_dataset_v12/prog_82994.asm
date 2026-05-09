; DESCRIPTION: Renders a white box of size 113x52 starting at (342, 16).
; PLAN: r0=342(x), r1=16(y), r2=113(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 16
LDI r2, 113
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
