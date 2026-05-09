; DESCRIPTION: Composite: . Then Places a black line segment connecting (246, 72) to (178, 16). Then Creates a red circular shape at (108, 58) with radius 27.
; PLAN: r0=246(x1), r1=72(y1), r2=178(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=108(x), r1=58(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black line segment connecting (246, 72) to (178, 16).
; PLAN: r0=246(x1), r1=72(y1), r2=178(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 72
LDI r2, 178
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a red circular shape at (108, 58) with radius 27.
; PLAN: r0=108(x), r1=58(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 58
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
