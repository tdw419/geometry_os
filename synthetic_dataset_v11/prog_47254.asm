; DESCRIPTION: Composite: . Then Renders a cyan disk with center (65, 25) and radius 22. Then Draws a white line from (61, 196) to (147, 32).
; PLAN: r0=65(x), r1=25(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=61(x1), r1=196(y1), r2=147(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (65, 25) and radius 22.
; PLAN: r0=65(x), r1=25(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 25
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white line from (61, 196) to (147, 32).
; PLAN: r0=61(x1), r1=196(y1), r2=147(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 196
LDI r2, 147
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
