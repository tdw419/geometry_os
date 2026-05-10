; DESCRIPTION: Renders a yellow line between points (394, 197) and (215, 107).
; PLAN: r0=394(x1), r1=197(y1), r2=215(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 197
LDI r2, 215
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
