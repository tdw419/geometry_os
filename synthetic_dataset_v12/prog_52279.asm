; DESCRIPTION: Composite: Places a green circle of radius 56 at center (456, 131) then Places a blue 89x24 rectangle at position (143, 205) then Places a cyan dot at position (300, 54).
; PLAN: r0=456(x), r1=131(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=143(x), r6=205(y), r7=89(width), r8=24(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=300(x), r11=54(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 456
LDI r1, 131
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 143
LDI r6, 205
LDI r7, 89
LDI r8, 24
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 300
LDI r11, 54
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
