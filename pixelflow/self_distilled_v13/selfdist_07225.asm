; DESCRIPTION: Places a yellow 63x120 box at position (397, 192).
; PLAN: r0=397(x), r1=192(y), r2=63(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 192
LDI r2, 63
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
