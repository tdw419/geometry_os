; DESCRIPTION: Renders a white box of size 56x115 starting at (90, 38).
; PLAN: r0=90(x), r1=38(y), r2=56(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 38
LDI r2, 56
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
