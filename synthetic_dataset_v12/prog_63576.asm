; DESCRIPTION: Renders a yellow line between points (263, 213) and (282, 195).
; PLAN: r0=263(x1), r1=213(y1), r2=282(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 213
LDI r2, 282
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
