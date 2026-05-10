; DESCRIPTION: Places a yellow 44x64 box at position (238, 15).
; PLAN: r0=238(x), r1=15(y), r2=44(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 15
LDI r2, 44
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
