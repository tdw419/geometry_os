; DESCRIPTION: Renders a black line between points (284, 215) and (437, 51).
; PLAN: r0=284(x1), r1=215(y1), r2=437(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 215
LDI r2, 437
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
