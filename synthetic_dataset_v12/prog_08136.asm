; DESCRIPTION: Draws a cyan line from (286, 233) to (295, 193).
; PLAN: r0=286(x1), r1=233(y1), r2=295(x2), r3=193(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 233
LDI r2, 295
LDI r3, 193
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
