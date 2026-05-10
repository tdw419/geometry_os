; DESCRIPTION: Composite: Creates a purple rectangular region at (408, 33) spanning 62 by 74 pixels then Draws a black line from (277, 165) to (502, 231).
; PLAN: r0=408(x), r1=33(y), r2=62(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=277(x1), r6=165(y1), r7=502(x2), r8=231(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 408
LDI r1, 33
LDI r2, 62
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 165
LDI r7, 502
LDI r8, 231
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
