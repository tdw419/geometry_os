; DESCRIPTION: Renders a black line between points (215, 164) and (1, 27).
; PLAN: r0=215(x1), r1=164(y1), r2=1(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 164
LDI r2, 1
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
