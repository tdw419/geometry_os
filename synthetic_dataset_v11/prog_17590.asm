; DESCRIPTION: Composite: . Then Places a black line segment connecting (157, 189) to (145, 249). Then Creates a purple rectangular region at (107, 8) spanning 115 by 61 pixels.
; PLAN: r0=157(x1), r1=189(y1), r2=145(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=107(x), r1=8(y), r2=115(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black line segment connecting (157, 189) to (145, 249).
; PLAN: r0=157(x1), r1=189(y1), r2=145(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 189
LDI r2, 145
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple rectangular region at (107, 8) spanning 115 by 61 pixels.
; PLAN: r0=107(x), r1=8(y), r2=115(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 8
LDI r2, 115
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
