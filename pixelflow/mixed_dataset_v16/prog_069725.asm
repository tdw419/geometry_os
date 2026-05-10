; DESCRIPTION: Renders a white box of size 89x73 starting at (305, 172).
; PLAN: r0=305(x), r1=172(y), r2=89(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 172
LDI r2, 89
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
