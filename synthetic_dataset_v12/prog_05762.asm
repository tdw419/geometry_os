; DESCRIPTION: Renders a red line between points (387, 23) and (258, 27).
; PLAN: r0=387(x1), r1=23(y1), r2=258(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 23
LDI r2, 258
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
