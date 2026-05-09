; DESCRIPTION: Composite: . Then Places a black line segment connecting (136, 141) to (237, 111). Then Creates a red rectangular region at (108, 177) spanning 104 by 35 pixels.
; PLAN: r0=136(x1), r1=141(y1), r2=237(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=108(x), r1=177(y), r2=104(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black line segment connecting (136, 141) to (237, 111).
; PLAN: r0=136(x1), r1=141(y1), r2=237(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 141
LDI r2, 237
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a red rectangular region at (108, 177) spanning 104 by 35 pixels.
; PLAN: r0=108(x), r1=177(y), r2=104(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 177
LDI r2, 104
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
