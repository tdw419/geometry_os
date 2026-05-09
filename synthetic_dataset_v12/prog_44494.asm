; DESCRIPTION: Places a cyan 94x32 rectangle at position (114, 131).
; PLAN: r0=114(x), r1=131(y), r2=94(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 131
LDI r2, 94
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
