; DESCRIPTION: Composite: Places a cyan dot at position (274, 159) then Renders a cyan disk with center (180, 173) and radius 22.
; PLAN: r0=274(x), r1=159(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=180(x), r6=173(y), r7=22(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 274
LDI r1, 159
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 180
LDI r6, 173
LDI r7, 22
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
