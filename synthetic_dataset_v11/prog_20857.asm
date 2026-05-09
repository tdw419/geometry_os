; DESCRIPTION: Composite: . Then Places a blue 48x87 rectangle at position (3, 116). Then Creates a red circular shape at (91, 93) with radius 52.
; PLAN: r0=3(x), r1=116(y), r2=48(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=91(x), r1=93(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue 48x87 rectangle at position (3, 116).
; PLAN: r0=3(x), r1=116(y), r2=48(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 116
LDI r2, 48
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a red circular shape at (91, 93) with radius 52.
; PLAN: r0=91(x), r1=93(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 93
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
