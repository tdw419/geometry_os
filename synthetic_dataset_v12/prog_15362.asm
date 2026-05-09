; DESCRIPTION: Renders a cyan line between points (196, 148) and (291, 160).
; PLAN: r0=196(x1), r1=148(y1), r2=291(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 148
LDI r2, 291
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
