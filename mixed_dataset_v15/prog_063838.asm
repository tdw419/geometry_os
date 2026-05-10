; DESCRIPTION: Composite: Places a blue 111x103 rectangle at position (3, 118) then Draws a cyan line from (382, 174) to (433, 200).
; PLAN: r0=3(x), r1=118(y), r2=111(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=382(x1), r6=174(y1), r7=433(x2), r8=200(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 3
LDI r1, 118
LDI r2, 111
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 174
LDI r7, 433
LDI r8, 200
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
