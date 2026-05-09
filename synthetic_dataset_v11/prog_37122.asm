; DESCRIPTION: Renders a white box of size 38x89 starting at (54, 57).
; PLAN: r0=54(x), r1=57(y), r2=38(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 57
LDI r2, 38
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
