; DESCRIPTION: Composite: Places a yellow 111x38 rectangle at position (235, 144) then Places a blue dot at position (439, 180) then Places a yellow circle of radius 34 at center (429, 159).
; PLAN: r0=235(x), r1=144(y), r2=111(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x), r6=180(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=429(x), r11=159(y), r12=34(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 235
LDI r1, 144
LDI r2, 111
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 180
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 429
LDI r11, 159
LDI r12, 34
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
