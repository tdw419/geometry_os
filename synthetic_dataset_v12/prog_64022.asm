; DESCRIPTION: Composite: Places a red dot at position (176, 194) then Draws a white line from (103, 87) to (122, 161).
; PLAN: r0=176(x), r1=194(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=103(x1), r6=87(y1), r7=122(x2), r8=161(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 194
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 103
LDI r6, 87
LDI r7, 122
LDI r8, 161
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
