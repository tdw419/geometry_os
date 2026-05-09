; DESCRIPTION: Composite: . Then Renders a green line between points (31, 250) and (233, 202). Then Renders a red box of size 52x58 starting at (143, 161).
; PLAN: r0=31(x1), r1=250(y1), r2=233(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=143(x), r1=161(y), r2=52(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green line between points (31, 250) and (233, 202).
; PLAN: r0=31(x1), r1=250(y1), r2=233(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 250
LDI r2, 233
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red box of size 52x58 starting at (143, 161).
; PLAN: r0=143(x), r1=161(y), r2=52(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 161
LDI r2, 52
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
