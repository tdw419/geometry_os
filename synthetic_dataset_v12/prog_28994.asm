; DESCRIPTION: Draws a red line from (443, 168) to (39, 44).
; PLAN: r0=443(x1), r1=168(y1), r2=39(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 168
LDI r2, 39
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
