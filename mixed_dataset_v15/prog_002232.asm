; DESCRIPTION: Composite: Draws a orange line from (367, 136) to (392, 242) then Places a cyan dot at position (471, 8).
; PLAN: r0=367(x1), r1=136(y1), r2=392(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=471(x), r6=8(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 367
LDI r1, 136
LDI r2, 392
LDI r3, 242
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 471
LDI r6, 8
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
