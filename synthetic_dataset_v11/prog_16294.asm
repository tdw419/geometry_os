; DESCRIPTION: Places a cyan 97x10 rectangle at position (58, 223).
; PLAN: r0=58(x), r1=223(y), r2=97(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 223
LDI r2, 97
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
