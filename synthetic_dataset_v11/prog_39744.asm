; DESCRIPTION: Renders a white box of size 117x96 starting at (113, 143).
; PLAN: r0=113(x), r1=143(y), r2=117(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 143
LDI r2, 117
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
