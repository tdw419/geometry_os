; DESCRIPTION: Composite: Renders a black line between points (392, 234) and (5, 149) then Places a yellow dot at position (82, 133).
; PLAN: r0=392(x1), r1=234(y1), r2=5(x2), r3=149(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=82(x), r6=133(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 392
LDI r1, 234
LDI r2, 5
LDI r3, 149
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 133
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
