; DESCRIPTION: Renders a green line between points (218, 213) and (179, 146).
; PLAN: r0=218(x1), r1=213(y1), r2=179(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 213
LDI r2, 179
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
