; DESCRIPTION: Composite: Places a white circle of radius 39 at center (387, 60) then Draws a red line from (243, 102) to (228, 83) then Places a blue dot at position (303, 198).
; PLAN: r0=387(x), r1=60(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=243(x1), r6=102(y1), r7=228(x2), r8=83(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=303(x), r11=198(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 387
LDI r1, 60
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 243
LDI r6, 102
LDI r7, 228
LDI r8, 83
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 303
LDI r11, 198
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
