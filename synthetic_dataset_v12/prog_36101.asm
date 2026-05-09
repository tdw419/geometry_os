; DESCRIPTION: Draws a green line from (295, 72) to (213, 200).
; PLAN: r0=295(x1), r1=72(y1), r2=213(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 72
LDI r2, 213
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
