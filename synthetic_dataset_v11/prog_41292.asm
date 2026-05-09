; DESCRIPTION: Composite: . Then Places a yellow 87x96 rectangle at position (48, 113). Then Places a orange circle of radius 72 at center (181, 157).
; PLAN: r0=48(x), r1=113(y), r2=87(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=181(x), r1=157(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow 87x96 rectangle at position (48, 113).
; PLAN: r0=48(x), r1=113(y), r2=87(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 113
LDI r2, 87
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange circle of radius 72 at center (181, 157).
; PLAN: r0=181(x), r1=157(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 157
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
