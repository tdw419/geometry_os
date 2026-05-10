; DESCRIPTION: Composite: Places a black 73x47 rectangle at position (82, 86) then Draws a magenta line from (486, 8) to (200, 8).
; PLAN: r0=82(x), r1=86(y), r2=73(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=486(x1), r6=8(y1), r7=200(x2), r8=8(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 82
LDI r1, 86
LDI r2, 73
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 486
LDI r6, 8
LDI r7, 200
LDI r8, 8
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
