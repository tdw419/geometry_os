; DESCRIPTION: Composite: . Then Places a orange 52x86 rectangle at position (64, 140). Then Renders a white disk with center (63, 95) and radius 28.
; PLAN: r0=64(x), r1=140(y), r2=52(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=63(x), r1=95(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange 52x86 rectangle at position (64, 140).
; PLAN: r0=64(x), r1=140(y), r2=52(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 140
LDI r2, 52
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white disk with center (63, 95) and radius 28.
; PLAN: r0=63(x), r1=95(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 95
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
