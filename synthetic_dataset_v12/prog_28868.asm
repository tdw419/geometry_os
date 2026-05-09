; DESCRIPTION: Composite: Places a orange dot at position (500, 72) then Draws a cyan line from (331, 220) to (431, 28).
; PLAN: r0=500(x), r1=72(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=331(x1), r6=220(y1), r7=431(x2), r8=28(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 500
LDI r1, 72
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 331
LDI r6, 220
LDI r7, 431
LDI r8, 28
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
