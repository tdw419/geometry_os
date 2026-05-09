; DESCRIPTION: Draws a cyan line from (374, 111) to (305, 184).
; PLAN: r0=374(x1), r1=111(y1), r2=305(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 111
LDI r2, 305
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
