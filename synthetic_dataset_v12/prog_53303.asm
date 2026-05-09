; DESCRIPTION: Draws a cyan line from (313, 4) to (171, 132).
; PLAN: r0=313(x1), r1=4(y1), r2=171(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 4
LDI r2, 171
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
