; DESCRIPTION: Renders a cyan line between points (254, 51) and (249, 213).
; PLAN: r0=254(x1), r1=51(y1), r2=249(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 51
LDI r2, 249
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
