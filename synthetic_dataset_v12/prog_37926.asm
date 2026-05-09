; DESCRIPTION: Renders a green box of size 87x120 starting at (351, 28).
; PLAN: r0=351(x), r1=28(y), r2=87(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 28
LDI r2, 87
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
