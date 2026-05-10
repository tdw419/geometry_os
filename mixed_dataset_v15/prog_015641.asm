; DESCRIPTION: Composite: Renders a blue box of size 93x48 starting at (30, 54) then Places a blue dot at position (115, 77).
; PLAN: r0=30(x), r1=54(y), r2=93(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=115(x), r6=77(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 30
LDI r1, 54
LDI r2, 93
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 77
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
