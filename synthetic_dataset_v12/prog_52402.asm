; DESCRIPTION: Draws a cyan line from (184, 247) to (135, 117).
; PLAN: r0=184(x1), r1=247(y1), r2=135(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 247
LDI r2, 135
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
