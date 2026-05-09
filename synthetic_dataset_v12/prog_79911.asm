; DESCRIPTION: Renders a black line between points (387, 5) and (178, 228).
; PLAN: r0=387(x1), r1=5(y1), r2=178(x2), r3=228(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 5
LDI r2, 178
LDI r3, 228
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
