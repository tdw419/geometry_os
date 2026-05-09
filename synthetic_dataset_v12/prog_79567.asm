; DESCRIPTION: Places a green 63x27 rectangle at position (245, 32).
; PLAN: r0=245(x), r1=32(y), r2=63(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 32
LDI r2, 63
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
