; DESCRIPTION: Draws a green line from (213, 98) to (239, 75).
; PLAN: r0=213(x1), r1=98(y1), r2=239(x2), r3=75(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 98
LDI r2, 239
LDI r3, 75
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
