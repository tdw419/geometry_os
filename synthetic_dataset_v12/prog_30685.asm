; DESCRIPTION: Composite: Places a cyan 102x40 rectangle at position (187, 63) then Places a blue dot at position (506, 14) then Places a white circle of radius 23 at center (400, 107).
; PLAN: r0=187(x), r1=63(y), r2=102(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=506(x), r6=14(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=400(x), r11=107(y), r12=23(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 187
LDI r1, 63
LDI r2, 102
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 506
LDI r6, 14
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 400
LDI r11, 107
LDI r12, 23
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
