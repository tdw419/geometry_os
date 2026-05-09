; DESCRIPTION: Composite: . Then Draws a cyan line from (210, 140) to (116, 11). Then Places a yellow circle of radius 59 at center (184, 79).
; PLAN: r0=210(x1), r1=140(y1), r2=116(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=184(x), r1=79(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan line from (210, 140) to (116, 11).
; PLAN: r0=210(x1), r1=140(y1), r2=116(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 140
LDI r2, 116
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 59 at center (184, 79).
; PLAN: r0=184(x), r1=79(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 79
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
