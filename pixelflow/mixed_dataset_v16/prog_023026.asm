; DESCRIPTION: Draws a yellow line from (410, 64) to (221, 16).
; PLAN: r0=410(x1), r1=64(y1), r2=221(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 64
LDI r2, 221
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
