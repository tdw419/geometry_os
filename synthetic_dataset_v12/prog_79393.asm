; DESCRIPTION: Renders a cyan box of size 63x10 starting at (351, 1).
; PLAN: r0=351(x), r1=1(y), r2=63(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 1
LDI r2, 63
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
