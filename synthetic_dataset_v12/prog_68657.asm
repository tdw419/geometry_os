; DESCRIPTION: Renders a cyan line between points (455, 214) and (202, 129).
; PLAN: r0=455(x1), r1=214(y1), r2=202(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 214
LDI r2, 202
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
