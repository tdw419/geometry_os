; DESCRIPTION: Draws a cyan line from (160, 148) to (213, 184).
; PLAN: r0=160(x1), r1=148(y1), r2=213(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 148
LDI r2, 213
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
