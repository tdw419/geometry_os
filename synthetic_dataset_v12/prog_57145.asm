; DESCRIPTION: Draws a red line from (446, 73) to (450, 107).
; PLAN: r0=446(x1), r1=73(y1), r2=450(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 73
LDI r2, 450
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
