; DESCRIPTION: Composite: . Then Draws a blue line from (22, 128) to (142, 253). Then Creates a black rectangular region at (146, 141) spanning 83 by 22 pixels.
; PLAN: r0=22(x1), r1=128(y1), r2=142(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=146(x), r1=141(y), r2=83(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue line from (22, 128) to (142, 253).
; PLAN: r0=22(x1), r1=128(y1), r2=142(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 128
LDI r2, 142
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black rectangular region at (146, 141) spanning 83 by 22 pixels.
; PLAN: r0=146(x), r1=141(y), r2=83(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 141
LDI r2, 83
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
