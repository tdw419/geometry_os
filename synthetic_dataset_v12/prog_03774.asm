; DESCRIPTION: Draws a cyan line from (374, 221) to (148, 90).
; PLAN: r0=374(x1), r1=221(y1), r2=148(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 221
LDI r2, 148
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
