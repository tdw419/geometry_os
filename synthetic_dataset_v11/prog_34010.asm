; DESCRIPTION: Composite: . Then Places a white 15x48 rectangle at position (209, 15). Then Draws a yellow line from (18, 190) to (134, 58).
; PLAN: r0=209(x), r1=15(y), r2=15(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=18(x1), r1=190(y1), r2=134(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white 15x48 rectangle at position (209, 15).
; PLAN: r0=209(x), r1=15(y), r2=15(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 15
LDI r2, 15
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow line from (18, 190) to (134, 58).
; PLAN: r0=18(x1), r1=190(y1), r2=134(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 190
LDI r2, 134
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
