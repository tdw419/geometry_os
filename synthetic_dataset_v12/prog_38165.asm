; DESCRIPTION: Composite: Creates a cyan rectangular region at (159, 129) spanning 78 by 113 pixels then Draws a blue line from (138, 254) to (238, 60) then Places a cyan dot at position (314, 196).
; PLAN: r0=159(x), r1=129(y), r2=78(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=138(x1), r6=254(y1), r7=238(x2), r8=60(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=314(x), r11=196(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 159
LDI r1, 129
LDI r2, 78
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 254
LDI r7, 238
LDI r8, 60
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 314
LDI r11, 196
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
