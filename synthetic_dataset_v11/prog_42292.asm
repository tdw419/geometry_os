; DESCRIPTION: Composite: . Then Renders a cyan line between points (198, 67) and (42, 214). Then Creates a black circular shape at (76, 106) with radius 68.
; PLAN: r0=198(x1), r1=67(y1), r2=42(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=76(x), r1=106(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan line between points (198, 67) and (42, 214).
; PLAN: r0=198(x1), r1=67(y1), r2=42(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 67
LDI r2, 42
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (76, 106) with radius 68.
; PLAN: r0=76(x), r1=106(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 106
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
