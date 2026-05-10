; DESCRIPTION: Places a cyan 14x112 rectangle at position (233, 129).
; PLAN: r0=233(x), r1=129(y), r2=14(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 129
LDI r2, 14
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
