; DESCRIPTION: Renders a yellow box of size 87x61 starting at (199, 89).
; PLAN: r0=199(x), r1=89(y), r2=87(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 89
LDI r2, 87
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
