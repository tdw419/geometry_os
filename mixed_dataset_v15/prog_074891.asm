; DESCRIPTION: Composite: Draws a blue line from (164, 165) to (346, 160) then Places a white dot at position (368, 24).
; PLAN: r0=164(x1), r1=165(y1), r2=346(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=368(x), r6=24(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 164
LDI r1, 165
LDI r2, 346
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 24
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
