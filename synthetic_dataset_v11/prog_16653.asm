; DESCRIPTION: Composite: . Then Places a black 94x116 rectangle at position (27, 17). Then Draws a green line from (84, 101) to (193, 41).
; PLAN: r0=27(x), r1=17(y), r2=94(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=84(x1), r1=101(y1), r2=193(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black 94x116 rectangle at position (27, 17).
; PLAN: r0=27(x), r1=17(y), r2=94(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 17
LDI r2, 94
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green line from (84, 101) to (193, 41).
; PLAN: r0=84(x1), r1=101(y1), r2=193(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 101
LDI r2, 193
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
