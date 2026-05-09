; DESCRIPTION: Composite: . Then Renders a purple line between points (236, 202) and (108, 228). Then Renders a cyan disk with center (82, 86) and radius 54.
; PLAN: r0=236(x1), r1=202(y1), r2=108(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=82(x), r1=86(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple line between points (236, 202) and (108, 228).
; PLAN: r0=236(x1), r1=202(y1), r2=108(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 202
LDI r2, 108
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan disk with center (82, 86) and radius 54.
; PLAN: r0=82(x), r1=86(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 86
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
