; DESCRIPTION: Draws a red line from (393, 107) to (178, 103).
; PLAN: r0=393(x1), r1=107(y1), r2=178(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 107
LDI r2, 178
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
