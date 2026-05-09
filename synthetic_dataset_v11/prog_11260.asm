; DESCRIPTION: Composite: . Then Places a white circle of radius 20 at center (146, 40). Then Renders a red line between points (218, 92) and (165, 171).
; PLAN: r0=146(x), r1=40(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=218(x1), r1=92(y1), r2=165(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 20 at center (146, 40).
; PLAN: r0=146(x), r1=40(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 40
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a red line between points (218, 92) and (165, 171).
; PLAN: r0=218(x1), r1=92(y1), r2=165(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 92
LDI r2, 165
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
