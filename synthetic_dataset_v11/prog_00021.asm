; DESCRIPTION: Renders a white box of size 51x65 starting at (197, 74).
; PLAN: r0=197(x), r1=74(y), r2=51(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 74
LDI r2, 51
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
