; DESCRIPTION: Composite: Places a green dot at position (204, 242) then Places a purple 37x30 rectangle at position (468, 194) then Renders a orange line between points (324, 244) and (425, 221).
; PLAN: r0=204(x), r1=242(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=468(x), r6=194(y), r7=37(width), r8=30(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=324(x1), r11=244(y1), r12=425(x2), r13=221(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 204
LDI r1, 242
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 468
LDI r6, 194
LDI r7, 37
LDI r8, 30
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 324
LDI r11, 244
LDI r12, 425
LDI r13, 221
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
