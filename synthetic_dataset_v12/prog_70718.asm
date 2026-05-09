; DESCRIPTION: Composite: Renders a cyan line between points (178, 143) and (365, 254) then Renders a green disk with center (202, 120) and radius 37 then Places a yellow dot at position (411, 19).
; PLAN: r0=178(x1), r1=143(y1), r2=365(x2), r3=254(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=120(y), r7=37(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=411(x), r11=19(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 178
LDI r1, 143
LDI r2, 365
LDI r3, 254
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 120
LDI r7, 37
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 411
LDI r11, 19
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
