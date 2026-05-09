; DESCRIPTION: Renders a white box of size 117x113 starting at (2, 131).
; PLAN: r0=2(x), r1=131(y), r2=117(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 131
LDI r2, 117
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
