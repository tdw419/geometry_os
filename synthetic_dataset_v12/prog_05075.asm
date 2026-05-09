; DESCRIPTION: Composite: Renders a white line between points (151, 149) and (479, 163) then Places a cyan dot at position (442, 213) then Renders a purple disk with center (305, 113) and radius 36.
; PLAN: r0=151(x1), r1=149(y1), r2=479(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=213(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=305(x), r11=113(y), r12=36(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 151
LDI r1, 149
LDI r2, 479
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 213
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 305
LDI r11, 113
LDI r12, 36
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
