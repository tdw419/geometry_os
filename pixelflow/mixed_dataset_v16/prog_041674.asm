; DESCRIPTION: Renders a white line between points (161, 187) and (6, 213).
; PLAN: r0=161(x1), r1=187(y1), r2=6(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 187
LDI r2, 6
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
