; DESCRIPTION: Renders a green line between points (421, 227) and (392, 213).
; PLAN: r0=421(x1), r1=227(y1), r2=392(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 227
LDI r2, 392
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
