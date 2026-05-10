; DESCRIPTION: Draws a cyan line from (267, 225) to (327, 155).
; PLAN: r0=267(x1), r1=225(y1), r2=327(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 225
LDI r2, 327
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
