; DESCRIPTION: Composite: . Then Places a yellow 10x59 rectangle at position (4, 85). Then Creates a red circular shape at (106, 82) with radius 74.
; PLAN: r0=4(x), r1=85(y), r2=10(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=106(x), r1=82(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow 10x59 rectangle at position (4, 85).
; PLAN: r0=4(x), r1=85(y), r2=10(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 85
LDI r2, 10
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a red circular shape at (106, 82) with radius 74.
; PLAN: r0=106(x), r1=82(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 82
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
