; DESCRIPTION: Composite: . Then Renders a blue disk with center (146, 186) and radius 57. Then Draws a cyan line from (0, 152) to (142, 24).
; PLAN: r0=146(x), r1=186(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=0(x1), r1=152(y1), r2=142(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (146, 186) and radius 57.
; PLAN: r0=146(x), r1=186(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 186
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan line from (0, 152) to (142, 24).
; PLAN: r0=0(x1), r1=152(y1), r2=142(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 152
LDI r2, 142
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
