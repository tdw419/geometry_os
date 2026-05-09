; DESCRIPTION: Composite: . Then Renders a green line between points (237, 20) and (76, 233). Then Creates a white rectangular region at (42, 88) spanning 41 by 51 pixels.
; PLAN: r0=237(x1), r1=20(y1), r2=76(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=42(x), r1=88(y), r2=41(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green line between points (237, 20) and (76, 233).
; PLAN: r0=237(x1), r1=20(y1), r2=76(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 20
LDI r2, 76
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white rectangular region at (42, 88) spanning 41 by 51 pixels.
; PLAN: r0=42(x), r1=88(y), r2=41(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 88
LDI r2, 41
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
