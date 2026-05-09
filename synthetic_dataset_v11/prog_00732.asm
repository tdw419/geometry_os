; DESCRIPTION: Draws a green line from (196, 191) to (200, 228).
; PLAN: r0=196(x1), r1=191(y1), r2=200(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 191
LDI r2, 200
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
