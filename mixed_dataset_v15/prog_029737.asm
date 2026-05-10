; DESCRIPTION: Renders a black line between points (262, 168) and (146, 195).
; PLAN: r0=262(x1), r1=168(y1), r2=146(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 168
LDI r2, 146
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
