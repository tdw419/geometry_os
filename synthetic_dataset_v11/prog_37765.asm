; DESCRIPTION: Composite: . Then Draws a white circle centered at (109, 103) with radius 70. Then Draws a white line from (240, 206) to (14, 39).
; PLAN: r0=109(x), r1=103(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=240(x1), r1=206(y1), r2=14(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white circle centered at (109, 103) with radius 70.
; PLAN: r0=109(x), r1=103(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 103
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white line from (240, 206) to (14, 39).
; PLAN: r0=240(x1), r1=206(y1), r2=14(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 206
LDI r2, 14
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
