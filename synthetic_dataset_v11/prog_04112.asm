; DESCRIPTION: Composite: . Then Places a green 13x112 rectangle at position (221, 136). Then Creates a orange circular shape at (128, 129) with radius 79.
; PLAN: r0=221(x), r1=136(y), r2=13(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=128(x), r1=129(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green 13x112 rectangle at position (221, 136).
; PLAN: r0=221(x), r1=136(y), r2=13(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 136
LDI r2, 13
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange circular shape at (128, 129) with radius 79.
; PLAN: r0=128(x), r1=129(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 129
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
