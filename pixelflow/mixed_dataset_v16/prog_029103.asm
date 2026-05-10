; DESCRIPTION: Composite: Places a magenta dot at position (127, 151) then Draws a orange line from (178, 196) to (346, 122).
; PLAN: r0=127(x), r1=151(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=178(x1), r6=196(y1), r7=346(x2), r8=122(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 127
LDI r1, 151
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 178
LDI r6, 196
LDI r7, 346
LDI r8, 122
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
