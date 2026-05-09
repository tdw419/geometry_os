; DESCRIPTION: Composite: Places a green dot at position (324, 161) then Draws a white line from (406, 87) to (220, 56).
; PLAN: r0=324(x), r1=161(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=406(x1), r6=87(y1), r7=220(x2), r8=56(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 324
LDI r1, 161
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 406
LDI r6, 87
LDI r7, 220
LDI r8, 56
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
