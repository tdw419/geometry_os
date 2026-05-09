; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (151, 63) with radius 57. Then Draws a green line from (42, 95) to (17, 95).
; PLAN: r0=151(x), r1=63(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=42(x1), r1=95(y1), r2=17(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow circle centered at (151, 63) with radius 57.
; PLAN: r0=151(x), r1=63(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 63
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green line from (42, 95) to (17, 95).
; PLAN: r0=42(x1), r1=95(y1), r2=17(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 95
LDI r2, 17
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
