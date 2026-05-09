; DESCRIPTION: Draws a cyan line from (245, 10) to (240, 29).
; PLAN: r0=245(x1), r1=10(y1), r2=240(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 10
LDI r2, 240
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
