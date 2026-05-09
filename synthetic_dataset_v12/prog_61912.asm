; DESCRIPTION: Composite: Renders a magenta line between points (304, 194) and (351, 251) then Renders a magenta box of size 114x48 starting at (75, 149) then Places a purple dot at position (418, 213).
; PLAN: r0=304(x1), r1=194(y1), r2=351(x2), r3=251(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=75(x), r6=149(y), r7=114(width), r8=48(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=418(x), r11=213(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 304
LDI r1, 194
LDI r2, 351
LDI r3, 251
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 149
LDI r7, 114
LDI r8, 48
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 418
LDI r11, 213
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
