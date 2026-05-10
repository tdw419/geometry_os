; DESCRIPTION: Places a green 29x64 box at position (124, 44).
; PLAN: r0=124(x), r1=44(y), r2=29(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 44
LDI r2, 29
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
