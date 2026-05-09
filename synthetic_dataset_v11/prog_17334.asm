; DESCRIPTION: Composite: . Then Renders a black box of size 57x24 starting at (36, 165). Then Renders a green line between points (30, 230) and (7, 184).
; PLAN: r0=36(x), r1=165(y), r2=57(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=30(x1), r1=230(y1), r2=7(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black box of size 57x24 starting at (36, 165).
; PLAN: r0=36(x), r1=165(y), r2=57(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 165
LDI r2, 57
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green line between points (30, 230) and (7, 184).
; PLAN: r0=30(x1), r1=230(y1), r2=7(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 230
LDI r2, 7
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
