; DESCRIPTION: Places a blue 26x64 rectangle at position (4, 91).
; PLAN: r0=4(x), r1=91(y), r2=26(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 91
LDI r2, 26
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
