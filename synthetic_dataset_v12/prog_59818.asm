; DESCRIPTION: Renders a white line between points (439, 195) and (27, 107).
; PLAN: r0=439(x1), r1=195(y1), r2=27(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 195
LDI r2, 27
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
