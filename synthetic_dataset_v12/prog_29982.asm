; DESCRIPTION: Draws a cyan line from (165, 146) to (267, 6).
; PLAN: r0=165(x1), r1=146(y1), r2=267(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 146
LDI r2, 267
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
