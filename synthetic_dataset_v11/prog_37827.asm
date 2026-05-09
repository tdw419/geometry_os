; DESCRIPTION: Composite: . Then Places a yellow circle of radius 23 at center (196, 73). Then Draws a cyan line from (53, 46) to (171, 168).
; PLAN: r0=196(x), r1=73(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=53(x1), r1=46(y1), r2=171(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow circle of radius 23 at center (196, 73).
; PLAN: r0=196(x), r1=73(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 73
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan line from (53, 46) to (171, 168).
; PLAN: r0=53(x1), r1=46(y1), r2=171(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 46
LDI r2, 171
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
