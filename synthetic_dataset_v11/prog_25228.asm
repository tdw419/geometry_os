; DESCRIPTION: Composite: . Then Places a cyan circle of radius 52 at center (52, 59). Then Draws a black line from (178, 114) to (239, 73).
; PLAN: r0=52(x), r1=59(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=178(x1), r1=114(y1), r2=239(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 52 at center (52, 59).
; PLAN: r0=52(x), r1=59(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 59
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black line from (178, 114) to (239, 73).
; PLAN: r0=178(x1), r1=114(y1), r2=239(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 114
LDI r2, 239
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
