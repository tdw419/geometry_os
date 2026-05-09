; DESCRIPTION: Composite: Draws a cyan line from (153, 163) to (504, 45) then Draws a magenta circle centered at (117, 70) with radius 54 then Places a orange dot at position (313, 113).
; PLAN: r0=153(x1), r1=163(y1), r2=504(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=117(x), r6=70(y), r7=54(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=313(x), r11=113(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 153
LDI r1, 163
LDI r2, 504
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 70
LDI r7, 54
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 313
LDI r11, 113
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
