; DESCRIPTION: Draws a white line from (176, 193) to (243, 253).
; PLAN: r0=176(x1), r1=193(y1), r2=243(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 193
LDI r2, 243
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
