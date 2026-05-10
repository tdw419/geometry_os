; DESCRIPTION: Renders a red line between points (488, 28) and (104, 82).
; PLAN: r0=488(x1), r1=28(y1), r2=104(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 28
LDI r2, 104
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
