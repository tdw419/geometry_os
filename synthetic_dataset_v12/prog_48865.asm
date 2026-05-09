; DESCRIPTION: Draws a black line from (480, 168) to (151, 171).
; PLAN: r0=480(x1), r1=168(y1), r2=151(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 168
LDI r2, 151
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
