; DESCRIPTION: Composite: Renders a green disk with center (91, 89) and radius 33 then Sets a single white pixel at (135, 147) then Places a cyan 98x38 rectangle at position (171, 210).
; PLAN: r0=91(x), r1=89(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=135(x), r6=147(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=171(x), r11=210(y), r12=98(width), r13=38(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 89
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 135
LDI r6, 147
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 171
LDI r11, 210
LDI r12, 98
LDI r13, 38
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
