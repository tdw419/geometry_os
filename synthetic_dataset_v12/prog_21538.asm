; DESCRIPTION: Renders a green line between points (480, 25) and (380, 29).
; PLAN: r0=480(x1), r1=25(y1), r2=380(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 25
LDI r2, 380
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
