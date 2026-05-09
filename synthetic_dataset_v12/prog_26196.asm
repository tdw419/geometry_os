; DESCRIPTION: Composite: Creates a blue rectangular region at (61, 59) spanning 66 by 96 pixels then Draws a green line from (275, 51) to (208, 7) then Places a magenta dot at position (357, 93).
; PLAN: r0=61(x), r1=59(y), r2=66(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x1), r6=51(y1), r7=208(x2), r8=7(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=357(x), r11=93(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 61
LDI r1, 59
LDI r2, 66
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 51
LDI r7, 208
LDI r8, 7
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 357
LDI r11, 93
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
