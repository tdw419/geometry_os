; DESCRIPTION: Composite: Renders a cyan disk with center (127, 90) and radius 40 then Draws a orange line from (151, 243) to (375, 156) then Places a cyan dot at position (465, 19).
; PLAN: r0=127(x), r1=90(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=151(x1), r6=243(y1), r7=375(x2), r8=156(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=465(x), r11=19(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 127
LDI r1, 90
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 151
LDI r6, 243
LDI r7, 375
LDI r8, 156
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 465
LDI r11, 19
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
