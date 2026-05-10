; DESCRIPTION: Composite: Renders a purple box of size 12x115 starting at (415, 35) then Sets a single green pixel at (495, 8).
; PLAN: r0=415(x), r1=35(y), r2=12(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=495(x), r6=8(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 415
LDI r1, 35
LDI r2, 12
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 495
LDI r6, 8
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
