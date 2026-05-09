; DESCRIPTION: Places a cyan 10x81 rectangle at position (113, 56).
; PLAN: r0=113(x), r1=56(y), r2=10(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 56
LDI r2, 10
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
