; DESCRIPTION: Composite: . Then Places a blue line segment connecting (245, 127) to (29, 190). Then Creates a yellow rectangular region at (79, 224) spanning 102 by 15 pixels.
; PLAN: r0=245(x1), r1=127(y1), r2=29(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=79(x), r1=224(y), r2=102(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue line segment connecting (245, 127) to (29, 190).
; PLAN: r0=245(x1), r1=127(y1), r2=29(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 127
LDI r2, 29
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow rectangular region at (79, 224) spanning 102 by 15 pixels.
; PLAN: r0=79(x), r1=224(y), r2=102(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 224
LDI r2, 102
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
