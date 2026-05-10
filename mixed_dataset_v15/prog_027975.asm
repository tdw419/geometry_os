; DESCRIPTION: Composite: Places a cyan 31x35 rectangle at position (415, 40) then Places a cyan dot at position (31, 142) then Creates a black circular shape at (365, 168) with radius 44.
; PLAN: r0=415(x), r1=40(y), r2=31(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=31(x), r6=142(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=365(x), r11=168(y), r12=44(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 415
LDI r1, 40
LDI r2, 31
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 142
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 365
LDI r11, 168
LDI r12, 44
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
