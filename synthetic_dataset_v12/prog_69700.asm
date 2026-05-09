; DESCRIPTION: Places a yellow 53x32 rectangle at position (409, 208).
; PLAN: r0=409(x), r1=208(y), r2=53(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 208
LDI r2, 53
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
