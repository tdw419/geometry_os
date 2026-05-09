; DESCRIPTION: Composite: Draws a cyan line from (169, 157) to (432, 86) then Places a cyan dot at position (481, 220) then Renders a white box of size 87x53 starting at (81, 125).
; PLAN: r0=169(x1), r1=157(y1), r2=432(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=481(x), r6=220(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=81(x), r11=125(y), r12=87(width), r13=53(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 169
LDI r1, 157
LDI r2, 432
LDI r3, 86
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 481
LDI r6, 220
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 81
LDI r11, 125
LDI r12, 87
LDI r13, 53
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
