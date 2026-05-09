; DESCRIPTION: Draws a green line from (213, 206) to (346, 133).
; PLAN: r0=213(x1), r1=206(y1), r2=346(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 206
LDI r2, 346
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
