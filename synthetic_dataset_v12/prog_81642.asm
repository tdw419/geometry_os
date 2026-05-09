; DESCRIPTION: Composite: Places a blue dot at position (180, 16) then Draws a cyan circle centered at (192, 160) with radius 22.
; PLAN: r0=180(x), r1=16(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=192(x), r6=160(y), r7=22(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 180
LDI r1, 16
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 192
LDI r6, 160
LDI r7, 22
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
