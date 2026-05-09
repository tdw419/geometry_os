; DESCRIPTION: Composite: Draws a cyan line from (433, 125) to (330, 161) then Draws a white circle centered at (396, 178) with radius 67.
; PLAN: r0=433(x1), r1=125(y1), r2=330(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=396(x), r6=178(y), r7=67(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 433
LDI r1, 125
LDI r2, 330
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 178
LDI r7, 67
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
