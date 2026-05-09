; DESCRIPTION: Composite: . Then Draws a white line from (248, 159) to (125, 54). Then Creates a cyan rectangular region at (147, 19) spanning 61 by 87 pixels.
; PLAN: r0=248(x1), r1=159(y1), r2=125(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=147(x), r1=19(y), r2=61(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white line from (248, 159) to (125, 54).
; PLAN: r0=248(x1), r1=159(y1), r2=125(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 159
LDI r2, 125
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan rectangular region at (147, 19) spanning 61 by 87 pixels.
; PLAN: r0=147(x), r1=19(y), r2=61(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 19
LDI r2, 61
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
