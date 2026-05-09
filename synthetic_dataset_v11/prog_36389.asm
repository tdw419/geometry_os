; DESCRIPTION: Renders a cyan line between points (209, 19) and (18, 237).
; PLAN: r0=209(x1), r1=19(y1), r2=18(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 19
LDI r2, 18
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
