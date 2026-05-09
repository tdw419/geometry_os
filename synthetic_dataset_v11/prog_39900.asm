; DESCRIPTION: Renders a green line between points (45, 164) and (191, 213).
; PLAN: r0=45(x1), r1=164(y1), r2=191(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 164
LDI r2, 191
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
