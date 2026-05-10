; DESCRIPTION: Composite: Places a cyan dot at position (303, 196) then Draws a magenta line from (408, 58) to (251, 210).
; PLAN: r0=303(x), r1=196(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=408(x1), r6=58(y1), r7=251(x2), r8=210(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 303
LDI r1, 196
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 408
LDI r6, 58
LDI r7, 251
LDI r8, 210
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
