; DESCRIPTION: Composite: . Then Places a cyan 60x53 rectangle at position (1, 169). Then Creates a green circular shape at (211, 151) with radius 36.
; PLAN: r0=1(x), r1=169(y), r2=60(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=211(x), r1=151(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan 60x53 rectangle at position (1, 169).
; PLAN: r0=1(x), r1=169(y), r2=60(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 169
LDI r2, 60
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green circular shape at (211, 151) with radius 36.
; PLAN: r0=211(x), r1=151(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 151
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
