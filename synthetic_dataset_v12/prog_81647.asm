; DESCRIPTION: Draws a purple line from (410, 4) to (174, 42).
; PLAN: r0=410(x1), r1=4(y1), r2=174(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 4
LDI r2, 174
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
