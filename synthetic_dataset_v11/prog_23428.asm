; DESCRIPTION: Composite: . Then Places a yellow 32x35 rectangle at position (79, 184). Then Renders a green disk with center (194, 193) and radius 36.
; PLAN: r0=79(x), r1=184(y), r2=32(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=194(x), r1=193(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow 32x35 rectangle at position (79, 184).
; PLAN: r0=79(x), r1=184(y), r2=32(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 184
LDI r2, 32
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green disk with center (194, 193) and radius 36.
; PLAN: r0=194(x), r1=193(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 193
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
