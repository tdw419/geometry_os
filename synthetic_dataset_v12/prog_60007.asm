; DESCRIPTION: Renders a red line between points (410, 108) and (284, 149).
; PLAN: r0=410(x1), r1=108(y1), r2=284(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 108
LDI r2, 284
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
