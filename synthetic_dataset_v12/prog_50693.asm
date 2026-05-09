; DESCRIPTION: Composite: Renders a green box of size 89x59 starting at (417, 87) then Draws a black line from (4, 194) to (152, 174) then Places a cyan dot at position (279, 140).
; PLAN: r0=417(x), r1=87(y), r2=89(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=4(x1), r6=194(y1), r7=152(x2), r8=174(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=279(x), r11=140(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 417
LDI r1, 87
LDI r2, 89
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 4
LDI r6, 194
LDI r7, 152
LDI r8, 174
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 279
LDI r11, 140
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
