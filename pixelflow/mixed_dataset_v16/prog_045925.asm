; DESCRIPTION: Renders a red line between points (401, 27) and (420, 121).
; PLAN: r0=401(x1), r1=27(y1), r2=420(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 27
LDI r2, 420
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
