; DESCRIPTION: Places a cyan 49x54 rectangle at position (132, 181).
; PLAN: r0=132(x), r1=181(y), r2=49(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 181
LDI r2, 49
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
