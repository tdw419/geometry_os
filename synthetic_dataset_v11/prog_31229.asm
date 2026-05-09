; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (74, 143) with radius 38. Then Places a cyan line segment connecting (195, 108) to (71, 85).
; PLAN: r0=74(x), r1=143(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=195(x1), r1=108(y1), r2=71(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta circle centered at (74, 143) with radius 38.
; PLAN: r0=74(x), r1=143(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 143
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan line segment connecting (195, 108) to (71, 85).
; PLAN: r0=195(x1), r1=108(y1), r2=71(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 108
LDI r2, 71
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
