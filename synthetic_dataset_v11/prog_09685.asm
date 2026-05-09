; DESCRIPTION: Places a yellow 102x32 rectangle at position (65, 132).
; PLAN: r0=65(x), r1=132(y), r2=102(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 132
LDI r2, 102
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
