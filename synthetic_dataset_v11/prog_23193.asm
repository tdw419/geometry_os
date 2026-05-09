; DESCRIPTION: Composite: . Then Places a orange 63x119 rectangle at position (156, 95). Then Places a red circle of radius 80 at center (102, 158).
; PLAN: r0=156(x), r1=95(y), r2=63(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=102(x), r1=158(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange 63x119 rectangle at position (156, 95).
; PLAN: r0=156(x), r1=95(y), r2=63(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 95
LDI r2, 63
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 80 at center (102, 158).
; PLAN: r0=102(x), r1=158(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 158
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
