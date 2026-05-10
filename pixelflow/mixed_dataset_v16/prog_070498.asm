; DESCRIPTION: Renders a green line between points (279, 209) and (146, 237).
; PLAN: r0=279(x1), r1=209(y1), r2=146(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 209
LDI r2, 146
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
