; DESCRIPTION: Composite: . Then Draws a black line from (59, 128) to (65, 14). Then Renders a orange disk with center (126, 204) and radius 29.
; PLAN: r0=59(x1), r1=128(y1), r2=65(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=126(x), r1=204(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a black line from (59, 128) to (65, 14).
; PLAN: r0=59(x1), r1=128(y1), r2=65(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 128
LDI r2, 65
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange disk with center (126, 204) and radius 29.
; PLAN: r0=126(x), r1=204(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 204
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
