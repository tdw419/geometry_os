; DESCRIPTION: Composite: . Then Creates a red rectangular region at (115, 33) spanning 84 by 74 pixels. Then Draws a green line from (115, 217) to (138, 49).
; PLAN: r0=115(x), r1=33(y), r2=84(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=115(x1), r1=217(y1), r2=138(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red rectangular region at (115, 33) spanning 84 by 74 pixels.
; PLAN: r0=115(x), r1=33(y), r2=84(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 33
LDI r2, 84
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green line from (115, 217) to (138, 49).
; PLAN: r0=115(x1), r1=217(y1), r2=138(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 217
LDI r2, 138
LDI r3, 49
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
