; DESCRIPTION: Places a yellow 25x86 rectangle at position (231, 4).
; PLAN: r0=231(x), r1=4(y), r2=25(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 4
LDI r2, 25
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
