; DESCRIPTION: Places a cyan 72x64 rectangle at position (232, 25).
; PLAN: r0=232(x), r1=25(y), r2=72(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 25
LDI r2, 72
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
