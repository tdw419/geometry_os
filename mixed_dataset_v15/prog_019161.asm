; DESCRIPTION: Renders a white box of size 36x65 starting at (225, 74).
; PLAN: r0=225(x), r1=74(y), r2=36(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 74
LDI r2, 36
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
