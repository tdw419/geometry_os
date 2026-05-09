; DESCRIPTION: Composite: Places a green 70x79 rectangle at position (162, 82) then Draws a white line from (173, 129) to (424, 243) then Places a orange dot at position (27, 22).
; PLAN: r0=162(x), r1=82(y), r2=70(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=173(x1), r6=129(y1), r7=424(x2), r8=243(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=27(x), r11=22(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 162
LDI r1, 82
LDI r2, 70
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 129
LDI r7, 424
LDI r8, 243
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 27
LDI r11, 22
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
