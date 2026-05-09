; DESCRIPTION: Draws a red line from (410, 170) to (178, 171).
; PLAN: r0=410(x1), r1=170(y1), r2=178(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 170
LDI r2, 178
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
