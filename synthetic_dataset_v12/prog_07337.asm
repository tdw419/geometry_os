; DESCRIPTION: Draws a white line from (160, 197) to (478, 228).
; PLAN: r0=160(x1), r1=197(y1), r2=478(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 197
LDI r2, 478
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
