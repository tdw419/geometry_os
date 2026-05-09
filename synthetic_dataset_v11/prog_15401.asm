; DESCRIPTION: Composite: . Then Places a white circle of radius 48 at center (75, 63). Then Draws a cyan line from (161, 165) to (196, 116).
; PLAN: r0=75(x), r1=63(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=161(x1), r1=165(y1), r2=196(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 48 at center (75, 63).
; PLAN: r0=75(x), r1=63(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 63
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan line from (161, 165) to (196, 116).
; PLAN: r0=161(x1), r1=165(y1), r2=196(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 165
LDI r2, 196
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
