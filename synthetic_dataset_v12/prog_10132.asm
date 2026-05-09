; DESCRIPTION: Renders a white line between points (176, 245) and (202, 196).
; PLAN: r0=176(x1), r1=245(y1), r2=202(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 245
LDI r2, 202
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
