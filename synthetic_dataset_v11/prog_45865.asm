; DESCRIPTION: Composite: . Then Creates a red circular shape at (87, 42) with radius 13. Then Places a blue line segment connecting (223, 214) to (74, 50).
; PLAN: r0=87(x), r1=42(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=223(x1), r1=214(y1), r2=74(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red circular shape at (87, 42) with radius 13.
; PLAN: r0=87(x), r1=42(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 42
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue line segment connecting (223, 214) to (74, 50).
; PLAN: r0=223(x1), r1=214(y1), r2=74(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 214
LDI r2, 74
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
