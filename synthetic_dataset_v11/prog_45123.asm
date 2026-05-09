; DESCRIPTION: Composite: . Then Places a red circle of radius 32 at center (217, 202). Then Renders a white line between points (188, 230) and (180, 236).
; PLAN: r0=217(x), r1=202(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=188(x1), r1=230(y1), r2=180(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 32 at center (217, 202).
; PLAN: r0=217(x), r1=202(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 202
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a white line between points (188, 230) and (180, 236).
; PLAN: r0=188(x1), r1=230(y1), r2=180(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 230
LDI r2, 180
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
