; DESCRIPTION: Draws a green line from (168, 153) to (174, 195).
; PLAN: r0=168(x1), r1=153(y1), r2=174(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 153
LDI r2, 174
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
