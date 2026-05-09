; DESCRIPTION: Composite: Renders a purple disk with center (233, 126) and radius 51 then Places a green 78x99 rectangle at position (404, 127).
; PLAN: r0=233(x), r1=126(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=404(x), r6=127(y), r7=78(width), r8=99(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 233
LDI r1, 126
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 404
LDI r6, 127
LDI r7, 78
LDI r8, 99
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
