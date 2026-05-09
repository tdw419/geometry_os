; DESCRIPTION: Places a cyan 17x10 rectangle at position (58, 182).
; PLAN: r0=58(x), r1=182(y), r2=17(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 182
LDI r2, 17
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
