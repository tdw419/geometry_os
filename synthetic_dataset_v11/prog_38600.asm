; DESCRIPTION: Composite: . Then Places a red circle of radius 58 at center (192, 65). Then Renders a white line between points (65, 42) and (48, 116).
; PLAN: r0=192(x), r1=65(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=65(x1), r1=42(y1), r2=48(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 58 at center (192, 65).
; PLAN: r0=192(x), r1=65(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 65
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a white line between points (65, 42) and (48, 116).
; PLAN: r0=65(x1), r1=42(y1), r2=48(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 42
LDI r2, 48
LDI r3, 116
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
