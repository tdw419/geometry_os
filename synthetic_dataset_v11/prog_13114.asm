; DESCRIPTION: Composite: . Then Draws a yellow line from (31, 206) to (226, 57). Then Creates a blue rectangular region at (3, 109) spanning 64 by 11 pixels.
; PLAN: r0=31(x1), r1=206(y1), r2=226(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=3(x), r1=109(y), r2=64(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow line from (31, 206) to (226, 57).
; PLAN: r0=31(x1), r1=206(y1), r2=226(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 206
LDI r2, 226
LDI r3, 57
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue rectangular region at (3, 109) spanning 64 by 11 pixels.
; PLAN: r0=3(x), r1=109(y), r2=64(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 109
LDI r2, 64
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
