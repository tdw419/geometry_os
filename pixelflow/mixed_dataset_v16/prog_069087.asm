; DESCRIPTION: Draws a yellow line from (465, 36) to (171, 166).
; PLAN: r0=465(x1), r1=36(y1), r2=171(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 36
LDI r2, 171
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
