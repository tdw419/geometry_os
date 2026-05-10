; DESCRIPTION: Renders a white box of size 73x63 starting at (73, 126).
; PLAN: r0=73(x), r1=126(y), r2=73(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 126
LDI r2, 73
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
