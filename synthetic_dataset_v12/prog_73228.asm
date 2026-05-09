; DESCRIPTION: Draws a green line from (356, 149) to (443, 192).
; PLAN: r0=356(x1), r1=149(y1), r2=443(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 149
LDI r2, 443
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
