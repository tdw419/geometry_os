; DESCRIPTION: Renders a cyan line between points (136, 238) and (213, 177).
; PLAN: r0=136(x1), r1=238(y1), r2=213(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 238
LDI r2, 213
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
