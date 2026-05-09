; DESCRIPTION: Composite: Places a yellow dot at position (105, 233) then Draws a orange line from (480, 221) to (236, 198).
; PLAN: r0=105(x), r1=233(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=480(x1), r6=221(y1), r7=236(x2), r8=198(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 105
LDI r1, 233
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 480
LDI r6, 221
LDI r7, 236
LDI r8, 198
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
