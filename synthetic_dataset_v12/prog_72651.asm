; DESCRIPTION: Draws a cyan line from (269, 63) to (317, 148).
; PLAN: r0=269(x1), r1=63(y1), r2=317(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 63
LDI r2, 317
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
