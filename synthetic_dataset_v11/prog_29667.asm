; DESCRIPTION: Composite: . Then Places a black line segment connecting (242, 138) to (146, 61). Then Draws a white rectangle at (196, 216) with width 53 and height 10.
; PLAN: r0=242(x1), r1=138(y1), r2=146(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=196(x), r1=216(y), r2=53(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black line segment connecting (242, 138) to (146, 61).
; PLAN: r0=242(x1), r1=138(y1), r2=146(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 138
LDI r2, 146
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white rectangle at (196, 216) with width 53 and height 10.
; PLAN: r0=196(x), r1=216(y), r2=53(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 216
LDI r2, 53
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
