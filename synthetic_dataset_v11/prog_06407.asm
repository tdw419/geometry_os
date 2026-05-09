; DESCRIPTION: Composite: . Then Draws a red line from (130, 31) to (60, 161). Then Creates a purple rectangular region at (57, 93) spanning 115 by 69 pixels.
; PLAN: r0=130(x1), r1=31(y1), r2=60(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=57(x), r1=93(y), r2=115(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red line from (130, 31) to (60, 161).
; PLAN: r0=130(x1), r1=31(y1), r2=60(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 31
LDI r2, 60
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple rectangular region at (57, 93) spanning 115 by 69 pixels.
; PLAN: r0=57(x), r1=93(y), r2=115(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 93
LDI r2, 115
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
