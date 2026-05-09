; DESCRIPTION: Places a black 24x48 rectangle at position (253, 102).
; PLAN: r0=253(x), r1=102(y), r2=24(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 102
LDI r2, 24
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
