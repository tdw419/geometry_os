; DESCRIPTION: Places a yellow 40x86 rectangle at position (44, 131).
; PLAN: r0=44(x), r1=131(y), r2=40(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 131
LDI r2, 40
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
