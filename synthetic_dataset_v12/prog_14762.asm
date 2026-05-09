; DESCRIPTION: Renders a purple box of size 30x85 starting at (344, 38).
; PLAN: r0=344(x), r1=38(y), r2=30(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 38
LDI r2, 30
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
