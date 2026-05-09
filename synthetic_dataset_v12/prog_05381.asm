; DESCRIPTION: Composite: Places a yellow 119x86 rectangle at position (361, 20) then Sets a single cyan pixel at (67, 189) then Renders a green line between points (508, 20) and (354, 100).
; PLAN: r0=361(x), r1=20(y), r2=119(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=67(x), r6=189(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=508(x1), r11=20(y1), r12=354(x2), r13=100(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 361
LDI r1, 20
LDI r2, 119
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 189
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 508
LDI r11, 20
LDI r12, 354
LDI r13, 100
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
