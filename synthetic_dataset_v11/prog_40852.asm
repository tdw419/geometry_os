; DESCRIPTION: Composite: . Then Renders a black box of size 29x115 starting at (133, 127). Then Draws a yellow circle centered at (87, 103) with radius 79.
; PLAN: r0=133(x), r1=127(y), r2=29(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=87(x), r1=103(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black box of size 29x115 starting at (133, 127).
; PLAN: r0=133(x), r1=127(y), r2=29(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 127
LDI r2, 29
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow circle centered at (87, 103) with radius 79.
; PLAN: r0=87(x), r1=103(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 103
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
