; DESCRIPTION: Composite: Places a green 32x20 rectangle at position (132, 188) then Places a orange dot at position (215, 0) then Draws a cyan line from (139, 66) to (15, 132).
; PLAN: r0=132(x), r1=188(y), r2=32(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=215(x), r6=0(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=139(x1), r11=66(y1), r12=15(x2), r13=132(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 132
LDI r1, 188
LDI r2, 32
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 0
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 139
LDI r11, 66
LDI r12, 15
LDI r13, 132
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
