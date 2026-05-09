; DESCRIPTION: Composite: . Then Renders a cyan line between points (196, 88) and (124, 202). Then Places a yellow circle of radius 28 at center (71, 144).
; PLAN: r0=196(x1), r1=88(y1), r2=124(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=71(x), r1=144(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan line between points (196, 88) and (124, 202).
; PLAN: r0=196(x1), r1=88(y1), r2=124(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 88
LDI r2, 124
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 28 at center (71, 144).
; PLAN: r0=71(x), r1=144(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 144
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
