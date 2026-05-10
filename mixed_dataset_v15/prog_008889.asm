; DESCRIPTION: Composite: Renders a purple box of size 80x15 starting at (22, 219) then Places a blue dot at position (180, 75).
; PLAN: r0=22(x), r1=219(y), r2=80(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=180(x), r6=75(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 22
LDI r1, 219
LDI r2, 80
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 75
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
