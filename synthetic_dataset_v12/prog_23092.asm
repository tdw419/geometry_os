; DESCRIPTION: Composite: Places a purple dot at position (290, 103) then Draws a blue line from (280, 203) to (202, 247).
; PLAN: r0=290(x), r1=103(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=280(x1), r6=203(y1), r7=202(x2), r8=247(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 290
LDI r1, 103
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 280
LDI r6, 203
LDI r7, 202
LDI r8, 247
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
