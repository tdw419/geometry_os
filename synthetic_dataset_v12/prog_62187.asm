; DESCRIPTION: Composite: Draws a orange line from (256, 41) to (259, 37) then Places a yellow dot at position (327, 150).
; PLAN: r0=256(x1), r1=41(y1), r2=259(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=327(x), r6=150(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 256
LDI r1, 41
LDI r2, 259
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 150
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
