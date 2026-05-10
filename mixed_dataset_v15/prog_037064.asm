; DESCRIPTION: Composite: Creates a cyan rectangular region at (52, 20) spanning 40 by 97 pixels then Draws a white line from (460, 204) to (258, 150) then Places a blue dot at position (10, 7).
; PLAN: r0=52(x), r1=20(y), r2=40(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=460(x1), r6=204(y1), r7=258(x2), r8=150(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=10(x), r11=7(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 52
LDI r1, 20
LDI r2, 40
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 204
LDI r7, 258
LDI r8, 150
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 10
LDI r11, 7
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
