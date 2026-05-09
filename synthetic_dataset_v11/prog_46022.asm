; DESCRIPTION: Renders a green line between points (32, 27) and (241, 107).
; PLAN: r0=32(x1), r1=27(y1), r2=241(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 27
LDI r2, 241
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
