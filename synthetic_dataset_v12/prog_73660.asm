; DESCRIPTION: Draws a cyan line from (132, 171) to (187, 7).
; PLAN: r0=132(x1), r1=171(y1), r2=187(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 171
LDI r2, 187
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
