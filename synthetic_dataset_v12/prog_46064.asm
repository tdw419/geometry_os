; DESCRIPTION: Renders a cyan box of size 70x14 starting at (351, 148).
; PLAN: r0=351(x), r1=148(y), r2=70(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 148
LDI r2, 70
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
