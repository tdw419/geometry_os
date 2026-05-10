; DESCRIPTION: Composite: Renders a black line between points (319, 2) and (242, 166) then Places a green 16x96 rectangle at position (456, 80).
; PLAN: r0=319(x1), r1=2(y1), r2=242(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=456(x), r6=80(y), r7=16(width), r8=96(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 319
LDI r1, 2
LDI r2, 242
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 80
LDI r7, 16
LDI r8, 96
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
