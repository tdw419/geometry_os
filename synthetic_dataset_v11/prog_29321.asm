; DESCRIPTION: Renders a white line between points (213, 239) and (177, 164).
; PLAN: r0=213(x1), r1=239(y1), r2=177(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 239
LDI r2, 177
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
