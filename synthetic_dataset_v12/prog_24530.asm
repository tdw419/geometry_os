; DESCRIPTION: Places a yellow 64x80 rectangle at position (71, 98).
; PLAN: r0=71(x), r1=98(y), r2=64(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 98
LDI r2, 64
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
