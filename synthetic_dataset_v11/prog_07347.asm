; DESCRIPTION: Composite: . Then Creates a black rectangular region at (66, 82) spanning 103 by 52 pixels. Then Draws a green line from (120, 155) to (40, 121).
; PLAN: r0=66(x), r1=82(y), r2=103(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=120(x1), r1=155(y1), r2=40(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a black rectangular region at (66, 82) spanning 103 by 52 pixels.
; PLAN: r0=66(x), r1=82(y), r2=103(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 82
LDI r2, 103
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green line from (120, 155) to (40, 121).
; PLAN: r0=120(x1), r1=155(y1), r2=40(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 155
LDI r2, 40
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
