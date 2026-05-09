; DESCRIPTION: Composite: Places a white 18x49 rectangle at position (367, 171) then Places a white dot at position (449, 18) then Draws a magenta line from (437, 164) to (16, 165).
; PLAN: r0=367(x), r1=171(y), r2=18(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=449(x), r6=18(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=437(x1), r11=164(y1), r12=16(x2), r13=165(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 367
LDI r1, 171
LDI r2, 18
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 18
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 437
LDI r11, 164
LDI r12, 16
LDI r13, 165
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
