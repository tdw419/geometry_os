; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (56, 195) with radius 48. Then Draws a yellow line from (39, 161) to (1, 229).
; PLAN: r0=56(x), r1=195(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=39(x1), r1=161(y1), r2=1(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan circle centered at (56, 195) with radius 48.
; PLAN: r0=56(x), r1=195(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 195
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a yellow line from (39, 161) to (1, 229).
; PLAN: r0=39(x1), r1=161(y1), r2=1(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 161
LDI r2, 1
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
