; DESCRIPTION: Renders a white box of size 25x49 starting at (429, 197).
; PLAN: r0=429(x), r1=197(y), r2=25(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 197
LDI r2, 25
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
