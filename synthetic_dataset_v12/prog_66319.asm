; DESCRIPTION: Draws a green line from (464, 96) to (174, 143).
; PLAN: r0=464(x1), r1=96(y1), r2=174(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 96
LDI r2, 174
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
