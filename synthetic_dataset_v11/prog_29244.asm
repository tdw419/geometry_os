; DESCRIPTION: Composite: . Then Renders a white disk with center (111, 176) and radius 50. Then Draws a red line from (208, 39) to (168, 248).
; PLAN: r0=111(x), r1=176(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=208(x1), r1=39(y1), r2=168(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (111, 176) and radius 50.
; PLAN: r0=111(x), r1=176(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 176
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red line from (208, 39) to (168, 248).
; PLAN: r0=208(x1), r1=39(y1), r2=168(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 39
LDI r2, 168
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
