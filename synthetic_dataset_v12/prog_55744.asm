; DESCRIPTION: Composite: Renders a blue line between points (264, 230) and (70, 86) then Places a cyan dot at position (111, 30).
; PLAN: r0=264(x1), r1=230(y1), r2=70(x2), r3=86(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=111(x), r6=30(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 264
LDI r1, 230
LDI r2, 70
LDI r3, 86
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 30
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
