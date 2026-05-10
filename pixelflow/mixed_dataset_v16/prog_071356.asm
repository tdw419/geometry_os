; DESCRIPTION: Composite: Draws a cyan line from (220, 200) to (328, 24) then Renders a yellow disk with center (309, 63) and radius 53 then Places a white dot at position (413, 150).
; PLAN: r0=220(x1), r1=200(y1), r2=328(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=309(x), r6=63(y), r7=53(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=413(x), r11=150(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 220
LDI r1, 200
LDI r2, 328
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 63
LDI r7, 53
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 413
LDI r11, 150
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
