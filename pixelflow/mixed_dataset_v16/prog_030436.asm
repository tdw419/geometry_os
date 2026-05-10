; DESCRIPTION: Composite: Places a cyan dot at position (448, 16) then Places a magenta line segment connecting (504, 193) to (246, 46).
; PLAN: r0=448(x), r1=16(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=504(x1), r6=193(y1), r7=246(x2), r8=46(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 448
LDI r1, 16
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 504
LDI r6, 193
LDI r7, 246
LDI r8, 46
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
