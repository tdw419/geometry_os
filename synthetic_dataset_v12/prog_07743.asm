; DESCRIPTION: Composite: Places a blue 89x47 rectangle at position (405, 44) then Draws a yellow line from (111, 68) to (180, 68).
; PLAN: r0=405(x), r1=44(y), r2=89(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=111(x1), r6=68(y1), r7=180(x2), r8=68(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 405
LDI r1, 44
LDI r2, 89
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 68
LDI r7, 180
LDI r8, 68
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
