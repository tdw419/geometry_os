; DESCRIPTION: Renders a green line between points (492, 115) and (270, 213).
; PLAN: r0=492(x1), r1=115(y1), r2=270(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 115
LDI r2, 270
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
