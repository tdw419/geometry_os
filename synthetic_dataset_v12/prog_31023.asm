; DESCRIPTION: Composite: Places a orange dot at position (418, 198) then Draws a red line from (126, 209) to (168, 21).
; PLAN: r0=418(x), r1=198(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=126(x1), r6=209(y1), r7=168(x2), r8=21(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 418
LDI r1, 198
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 126
LDI r6, 209
LDI r7, 168
LDI r8, 21
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
