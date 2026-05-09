; DESCRIPTION: Renders a green box of size 47x89 starting at (199, 133).
; PLAN: r0=199(x), r1=133(y), r2=47(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 133
LDI r2, 47
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
