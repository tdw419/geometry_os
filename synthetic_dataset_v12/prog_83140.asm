; DESCRIPTION: Draws a cyan line from (465, 57) to (171, 4).
; PLAN: r0=465(x1), r1=57(y1), r2=171(x2), r3=4(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 57
LDI r2, 171
LDI r3, 4
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
