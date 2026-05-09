; DESCRIPTION: Composite: Renders a green box of size 44x89 starting at (75, 143) then Places a blue dot at position (96, 215).
; PLAN: r0=75(x), r1=143(y), r2=44(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=96(x), r6=215(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 75
LDI r1, 143
LDI r2, 44
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 215
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
