; DESCRIPTION: Renders a black line between points (59, 48) and (151, 228).
; PLAN: r0=59(x1), r1=48(y1), r2=151(x2), r3=228(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 48
LDI r2, 151
LDI r3, 228
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
