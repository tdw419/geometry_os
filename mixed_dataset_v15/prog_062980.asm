; DESCRIPTION: Renders a white box of size 17x64 starting at (189, 30).
; PLAN: r0=189(x), r1=30(y), r2=17(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 30
LDI r2, 17
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
