; DESCRIPTION: Composite: . Then Creates a red rectangular region at (107, 202) spanning 120 by 45 pixels. Then Draws a green line from (222, 191) to (85, 240).
; PLAN: r0=107(x), r1=202(y), r2=120(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=222(x1), r1=191(y1), r2=85(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red rectangular region at (107, 202) spanning 120 by 45 pixels.
; PLAN: r0=107(x), r1=202(y), r2=120(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 202
LDI r2, 120
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green line from (222, 191) to (85, 240).
; PLAN: r0=222(x1), r1=191(y1), r2=85(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 191
LDI r2, 85
LDI r3, 240
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
