; DESCRIPTION: Draws a green line from (366, 213) to (206, 192).
; PLAN: r0=366(x1), r1=213(y1), r2=206(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 213
LDI r2, 206
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
