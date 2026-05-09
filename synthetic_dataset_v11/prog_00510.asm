; DESCRIPTION: Places a yellow 103x14 rectangle at position (141, 242).
; PLAN: r0=141(x), r1=242(y), r2=103(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 242
LDI r2, 103
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
