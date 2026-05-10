; DESCRIPTION: Renders a black line between points (352, 195) and (253, 16).
; PLAN: r0=352(x1), r1=195(y1), r2=253(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 195
LDI r2, 253
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
