; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (44, 102) spanning 13 by 100 pixels. Then Draws a purple line from (179, 142) to (226, 95).
; PLAN: r0=44(x), r1=102(y), r2=13(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=179(x1), r1=142(y1), r2=226(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a cyan rectangular region at (44, 102) spanning 13 by 100 pixels.
; PLAN: r0=44(x), r1=102(y), r2=13(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 102
LDI r2, 13
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple line from (179, 142) to (226, 95).
; PLAN: r0=179(x1), r1=142(y1), r2=226(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 142
LDI r2, 226
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
