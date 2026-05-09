; DESCRIPTION: Renders a black line between points (213, 255) and (215, 38).
; PLAN: r0=213(x1), r1=255(y1), r2=215(x2), r3=38(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 255
LDI r2, 215
LDI r3, 38
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
