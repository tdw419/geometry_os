; DESCRIPTION: Places a yellow 102x14 rectangle at position (48, 142).
; PLAN: r0=48(x), r1=142(y), r2=102(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 142
LDI r2, 102
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
