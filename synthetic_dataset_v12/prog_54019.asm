; DESCRIPTION: Composite: Places a green dot at position (219, 205) then Renders a yellow line between points (16, 118) and (127, 91).
; PLAN: r0=219(x), r1=205(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=16(x1), r6=118(y1), r7=127(x2), r8=91(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 219
LDI r1, 205
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 16
LDI r6, 118
LDI r7, 127
LDI r8, 91
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
