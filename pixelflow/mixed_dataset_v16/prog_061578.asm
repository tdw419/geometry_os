; DESCRIPTION: Composite: Draws a black rectangle at (190, 154) with width 51 and height 43 then Draws a green line from (120, 48) to (425, 107) then Places a cyan dot at position (144, 216).
; PLAN: r0=190(x), r1=154(y), r2=51(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x1), r6=48(y1), r7=425(x2), r8=107(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=144(x), r11=216(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 190
LDI r1, 154
LDI r2, 51
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 48
LDI r7, 425
LDI r8, 107
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 144
LDI r11, 216
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
