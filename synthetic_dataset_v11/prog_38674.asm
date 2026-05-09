; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (121, 34) with radius 13. Then Places a red line segment connecting (121, 117) to (143, 141).
; PLAN: r0=121(x), r1=34(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=121(x1), r1=117(y1), r2=143(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta circular shape at (121, 34) with radius 13.
; PLAN: r0=121(x), r1=34(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 34
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red line segment connecting (121, 117) to (143, 141).
; PLAN: r0=121(x1), r1=117(y1), r2=143(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 117
LDI r2, 143
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
