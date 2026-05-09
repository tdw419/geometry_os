; DESCRIPTION: Composite: Renders a red box of size 87x119 starting at (358, 62) then Places a yellow dot at position (209, 0).
; PLAN: r0=358(x), r1=62(y), r2=87(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=209(x), r6=0(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 358
LDI r1, 62
LDI r2, 87
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 0
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
