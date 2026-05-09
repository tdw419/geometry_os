; DESCRIPTION: Composite: . Then Places a black 71x56 rectangle at position (136, 90). Then Draws a yellow line from (138, 239) to (252, 242).
; PLAN: r0=136(x), r1=90(y), r2=71(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=138(x1), r1=239(y1), r2=252(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black 71x56 rectangle at position (136, 90).
; PLAN: r0=136(x), r1=90(y), r2=71(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 90
LDI r2, 71
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow line from (138, 239) to (252, 242).
; PLAN: r0=138(x1), r1=239(y1), r2=252(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 239
LDI r2, 252
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
