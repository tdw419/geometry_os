; DESCRIPTION: Places a yellow 50x64 rectangle at position (2, 44).
; PLAN: r0=2(x), r1=44(y), r2=50(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 44
LDI r2, 50
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
