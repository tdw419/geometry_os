; DESCRIPTION: Places a yellow 94x64 rectangle at position (156, 98).
; PLAN: r0=156(x), r1=98(y), r2=94(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 98
LDI r2, 94
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
