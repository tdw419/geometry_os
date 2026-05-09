; DESCRIPTION: Composite: Renders a purple box of size 83x18 starting at (271, 220) then Places a purple dot at position (415, 3).
; PLAN: r0=271(x), r1=220(y), r2=83(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=415(x), r6=3(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 271
LDI r1, 220
LDI r2, 83
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 3
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
