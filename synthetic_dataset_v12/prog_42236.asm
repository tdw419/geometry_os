; DESCRIPTION: Places a black 81x10 rectangle at position (233, 213).
; PLAN: r0=233(x), r1=213(y), r2=81(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 213
LDI r2, 81
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
