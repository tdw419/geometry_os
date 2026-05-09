; DESCRIPTION: Composite: Sets a single green pixel at (298, 180) then Places a blue 112x110 rectangle at position (330, 76) then Draws a orange line from (370, 47) to (143, 171).
; PLAN: r0=298(x), r1=180(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=330(x), r6=76(y), r7=112(width), r8=110(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=370(x1), r11=47(y1), r12=143(x2), r13=171(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 298
LDI r1, 180
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 330
LDI r6, 76
LDI r7, 112
LDI r8, 110
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 370
LDI r11, 47
LDI r12, 143
LDI r13, 171
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
