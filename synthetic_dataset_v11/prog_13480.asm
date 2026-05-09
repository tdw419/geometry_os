; DESCRIPTION: Renders a white line between points (108, 213) and (39, 27).
; PLAN: r0=108(x1), r1=213(y1), r2=39(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 213
LDI r2, 39
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
