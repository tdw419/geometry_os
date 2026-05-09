; DESCRIPTION: Renders a white box of size 43x115 starting at (57, 50).
; PLAN: r0=57(x), r1=50(y), r2=43(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 50
LDI r2, 43
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
