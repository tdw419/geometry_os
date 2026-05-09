; DESCRIPTION: Draws a cyan line from (275, 15) to (324, 229).
; PLAN: r0=275(x1), r1=15(y1), r2=324(x2), r3=229(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 15
LDI r2, 324
LDI r3, 229
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
