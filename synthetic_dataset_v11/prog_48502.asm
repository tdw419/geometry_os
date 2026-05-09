; DESCRIPTION: Draws a cyan line from (37, 59) to (24, 50).
; PLAN: r0=37(x1), r1=59(y1), r2=24(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 59
LDI r2, 24
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
