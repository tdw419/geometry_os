; DESCRIPTION: Composite: Draws a white line from (51, 243) to (94, 93) then Places a black 20x91 rectangle at position (133, 63).
; PLAN: r0=51(x1), r1=243(y1), r2=94(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=133(x), r6=63(y), r7=20(width), r8=91(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 51
LDI r1, 243
LDI r2, 94
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 63
LDI r7, 20
LDI r8, 91
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
