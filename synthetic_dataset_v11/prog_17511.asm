; DESCRIPTION: Places a cyan 84x87 rectangle at position (168, 81).
; PLAN: r0=168(x), r1=81(y), r2=84(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 81
LDI r2, 84
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
