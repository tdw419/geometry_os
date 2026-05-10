; DESCRIPTION: Composite: Places a magenta dot at position (187, 166) then Draws a yellow line from (144, 4) to (72, 17).
; PLAN: r0=187(x), r1=166(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=144(x1), r6=4(y1), r7=72(x2), r8=17(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 187
LDI r1, 166
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 144
LDI r6, 4
LDI r7, 72
LDI r8, 17
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
