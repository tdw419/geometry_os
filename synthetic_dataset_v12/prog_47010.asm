; DESCRIPTION: Composite: Renders a purple box of size 88x49 starting at (413, 184) then Sets a single cyan pixel at (12, 231).
; PLAN: r0=413(x), r1=184(y), r2=88(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=12(x), r6=231(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 413
LDI r1, 184
LDI r2, 88
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 12
LDI r6, 231
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
