; DESCRIPTION: Composite: Draws a yellow line from (387, 10) to (312, 26) then Places a cyan dot at position (214, 61).
; PLAN: r0=387(x1), r1=10(y1), r2=312(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=61(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 387
LDI r1, 10
LDI r2, 312
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 61
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
