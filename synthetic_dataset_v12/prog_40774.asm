; DESCRIPTION: Places a yellow 32x25 rectangle at position (335, 168).
; PLAN: r0=335(x), r1=168(y), r2=32(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 168
LDI r2, 32
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
