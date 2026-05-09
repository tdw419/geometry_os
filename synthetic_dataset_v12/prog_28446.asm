; DESCRIPTION: Renders a red line between points (32, 230) and (387, 67).
; PLAN: r0=32(x1), r1=230(y1), r2=387(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 230
LDI r2, 387
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
