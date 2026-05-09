; DESCRIPTION: Composite: . Then Places a black 91x14 rectangle at position (92, 174). Then Renders a magenta line between points (175, 230) and (183, 17).
; PLAN: r0=92(x), r1=174(y), r2=91(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=175(x1), r1=230(y1), r2=183(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black 91x14 rectangle at position (92, 174).
; PLAN: r0=92(x), r1=174(y), r2=91(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 174
LDI r2, 91
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta line between points (175, 230) and (183, 17).
; PLAN: r0=175(x1), r1=230(y1), r2=183(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 230
LDI r2, 183
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
