; DESCRIPTION: Composite: Renders a purple disk with center (365, 173) and radius 64 then Places a cyan dot at position (183, 31) then Renders a cyan line between points (239, 48) and (219, 235).
; PLAN: r0=365(x), r1=173(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=183(x), r6=31(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=239(x1), r11=48(y1), r12=219(x2), r13=235(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 365
LDI r1, 173
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 183
LDI r6, 31
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 239
LDI r11, 48
LDI r12, 219
LDI r13, 235
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
