; DESCRIPTION: Draws a white line from (113, 242) to (246, 174).
; PLAN: r0=113(x1), r1=242(y1), r2=246(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 242
LDI r2, 246
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
