; DESCRIPTION: Composite: . Then Draws a white circle centered at (80, 165) with radius 57. Then Renders a cyan line between points (9, 186) and (189, 108).
; PLAN: r0=80(x), r1=165(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=9(x1), r1=186(y1), r2=189(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white circle centered at (80, 165) with radius 57.
; PLAN: r0=80(x), r1=165(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 165
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan line between points (9, 186) and (189, 108).
; PLAN: r0=9(x1), r1=186(y1), r2=189(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 186
LDI r2, 189
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
