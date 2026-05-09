; DESCRIPTION: Composite: . Then Draws a blue line from (218, 213) to (130, 151). Then Draws a cyan circle centered at (87, 139) with radius 71.
; PLAN: r0=218(x1), r1=213(y1), r2=130(x2), r3=151(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=87(x), r1=139(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a blue line from (218, 213) to (130, 151).
; PLAN: r0=218(x1), r1=213(y1), r2=130(x2), r3=151(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 213
LDI r2, 130
LDI r3, 151
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan circle centered at (87, 139) with radius 71.
; PLAN: r0=87(x), r1=139(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 139
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
