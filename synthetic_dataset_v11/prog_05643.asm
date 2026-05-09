; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (127, 35) with radius 33. Then Draws a white line from (63, 204) to (219, 184).
; PLAN: r0=127(x), r1=35(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=63(x1), r1=204(y1), r2=219(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (127, 35) with radius 33.
; PLAN: r0=127(x), r1=35(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 35
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white line from (63, 204) to (219, 184).
; PLAN: r0=63(x1), r1=204(y1), r2=219(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 204
LDI r2, 219
LDI r3, 184
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
