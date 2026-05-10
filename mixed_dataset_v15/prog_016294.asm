; DESCRIPTION: Draws a cyan line from (270, 27) to (92, 142).
; PLAN: r0=270(x1), r1=27(y1), r2=92(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 27
LDI r2, 92
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
