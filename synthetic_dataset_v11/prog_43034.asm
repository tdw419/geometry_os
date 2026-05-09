; DESCRIPTION: Renders a white box of size 83x64 starting at (141, 112).
; PLAN: r0=141(x), r1=112(y), r2=83(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 112
LDI r2, 83
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
