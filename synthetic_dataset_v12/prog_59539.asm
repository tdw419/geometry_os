; DESCRIPTION: Draws a green line from (298, 55) to (209, 149).
; PLAN: r0=298(x1), r1=55(y1), r2=209(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 55
LDI r2, 209
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
