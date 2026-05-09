; DESCRIPTION: Composite: . Then Creates a green circular shape at (162, 67) with radius 60. Then Renders a green line between points (217, 204) and (44, 8).
; PLAN: r0=162(x), r1=67(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=217(x1), r1=204(y1), r2=44(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a green circular shape at (162, 67) with radius 60.
; PLAN: r0=162(x), r1=67(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 67
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a green line between points (217, 204) and (44, 8).
; PLAN: r0=217(x1), r1=204(y1), r2=44(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 204
LDI r2, 44
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
