; DESCRIPTION: Composite: Renders a yellow box of size 114x48 starting at (208, 119) then Places a blue dot at position (128, 119).
; PLAN: r0=208(x), r1=119(y), r2=114(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=128(x), r6=119(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 208
LDI r1, 119
LDI r2, 114
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 119
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
