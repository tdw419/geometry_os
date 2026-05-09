; DESCRIPTION: Composite: . Then Places a purple 27x14 rectangle at position (13, 174). Then Renders a blue line between points (227, 17) and (10, 177).
; PLAN: r0=13(x), r1=174(y), r2=27(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=227(x1), r1=17(y1), r2=10(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple 27x14 rectangle at position (13, 174).
; PLAN: r0=13(x), r1=174(y), r2=27(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 174
LDI r2, 27
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue line between points (227, 17) and (10, 177).
; PLAN: r0=227(x1), r1=17(y1), r2=10(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 17
LDI r2, 10
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
