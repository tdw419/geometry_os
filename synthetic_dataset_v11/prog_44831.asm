; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (164, 182) with radius 51. Then Draws a cyan line from (197, 196) to (23, 58).
; PLAN: r0=164(x), r1=182(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=197(x1), r1=196(y1), r2=23(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan circle centered at (164, 182) with radius 51.
; PLAN: r0=164(x), r1=182(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 182
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan line from (197, 196) to (23, 58).
; PLAN: r0=197(x1), r1=196(y1), r2=23(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 196
LDI r2, 23
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
