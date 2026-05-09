; DESCRIPTION: Composite: . Then Renders a black line between points (245, 0) and (71, 119). Then Places a black 25x102 rectangle at position (82, 85).
; PLAN: r0=245(x1), r1=0(y1), r2=71(x2), r3=119(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=82(x), r1=85(y), r2=25(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black line between points (245, 0) and (71, 119).
; PLAN: r0=245(x1), r1=0(y1), r2=71(x2), r3=119(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 0
LDI r2, 71
LDI r3, 119
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black 25x102 rectangle at position (82, 85).
; PLAN: r0=82(x), r1=85(y), r2=25(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 85
LDI r2, 25
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
