; DESCRIPTION: Draws a cyan line from (416, 204) to (170, 242).
; PLAN: r0=416(x1), r1=204(y1), r2=170(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 204
LDI r2, 170
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
