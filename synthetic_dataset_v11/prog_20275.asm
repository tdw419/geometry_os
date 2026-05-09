; DESCRIPTION: Composite: . Then Renders a white line between points (152, 150) and (10, 59). Then Draws a white circle centered at (175, 39) with radius 13.
; PLAN: r0=152(x1), r1=150(y1), r2=10(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=175(x), r1=39(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white line between points (152, 150) and (10, 59).
; PLAN: r0=152(x1), r1=150(y1), r2=10(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 150
LDI r2, 10
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white circle centered at (175, 39) with radius 13.
; PLAN: r0=175(x), r1=39(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 39
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
