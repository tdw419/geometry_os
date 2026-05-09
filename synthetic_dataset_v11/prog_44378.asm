; DESCRIPTION: Places a green line segment connecting (197, 249) to (143, 243).
; PLAN: r0=197(x1), r1=249(y1), r2=143(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 249
LDI r2, 143
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
