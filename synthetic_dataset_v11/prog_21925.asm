; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (139, 228) with radius 21. Then Places a red 80x46 rectangle at position (110, 169).
; PLAN: r0=139(x), r1=228(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=110(x), r1=169(y), r2=80(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta circular shape at (139, 228) with radius 21.
; PLAN: r0=139(x), r1=228(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 228
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red 80x46 rectangle at position (110, 169).
; PLAN: r0=110(x), r1=169(y), r2=80(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 169
LDI r2, 80
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
