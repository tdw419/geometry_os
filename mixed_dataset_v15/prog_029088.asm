; DESCRIPTION: Draws a cyan line from (381, 84) to (293, 111).
; PLAN: r0=381(x1), r1=84(y1), r2=293(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 84
LDI r2, 293
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
