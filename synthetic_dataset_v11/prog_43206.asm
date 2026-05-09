; DESCRIPTION: Composite: . Then Draws a yellow line from (20, 213) to (175, 143). Then Creates a yellow circular shape at (95, 168) with radius 35.
; PLAN: r0=20(x1), r1=213(y1), r2=175(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=95(x), r1=168(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a yellow line from (20, 213) to (175, 143).
; PLAN: r0=20(x1), r1=213(y1), r2=175(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 213
LDI r2, 175
LDI r3, 143
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow circular shape at (95, 168) with radius 35.
; PLAN: r0=95(x), r1=168(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 168
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
