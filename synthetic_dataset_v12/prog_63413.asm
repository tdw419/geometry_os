; DESCRIPTION: Composite: Draws a cyan rectangle at (376, 90) with width 86 and height 116 then Places a cyan dot at position (275, 147) then Draws a green line from (419, 80) to (197, 120).
; PLAN: r0=376(x), r1=90(y), r2=86(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x), r6=147(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=419(x1), r11=80(y1), r12=197(x2), r13=120(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 376
LDI r1, 90
LDI r2, 86
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 147
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 419
LDI r11, 80
LDI r12, 197
LDI r13, 120
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
