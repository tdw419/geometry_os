; DESCRIPTION: Draws a cyan line from (492, 146) to (233, 184).
; PLAN: r0=492(x1), r1=146(y1), r2=233(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 146
LDI r2, 233
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
