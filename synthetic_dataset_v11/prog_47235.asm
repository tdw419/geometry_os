; DESCRIPTION: Composite: . Then Places a red line segment connecting (127, 79) to (98, 217). Then Creates a yellow rectangular region at (208, 0) spanning 33 by 96 pixels.
; PLAN: r0=127(x1), r1=79(y1), r2=98(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=208(x), r1=0(y), r2=33(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red line segment connecting (127, 79) to (98, 217).
; PLAN: r0=127(x1), r1=79(y1), r2=98(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 79
LDI r2, 98
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow rectangular region at (208, 0) spanning 33 by 96 pixels.
; PLAN: r0=208(x), r1=0(y), r2=33(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 0
LDI r2, 33
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
