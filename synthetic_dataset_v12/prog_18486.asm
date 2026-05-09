; DESCRIPTION: Draws a orange line from (104, 209) to (498, 111).
; PLAN: r0=104(x1), r1=209(y1), r2=498(x2), r3=111(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 209
LDI r2, 498
LDI r3, 111
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
