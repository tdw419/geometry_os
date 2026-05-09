; DESCRIPTION: Renders a cyan line between points (151, 214) and (241, 32).
; PLAN: r0=151(x1), r1=214(y1), r2=241(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 214
LDI r2, 241
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
