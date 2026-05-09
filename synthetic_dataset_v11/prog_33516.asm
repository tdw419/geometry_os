; DESCRIPTION: Places a yellow 22x35 rectangle at position (197, 148).
; PLAN: r0=197(x), r1=148(y), r2=22(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 148
LDI r2, 22
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
