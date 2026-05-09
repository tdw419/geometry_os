; DESCRIPTION: Places a green 73x98 rectangle at position (409, 60).
; PLAN: r0=409(x), r1=60(y), r2=73(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 60
LDI r2, 73
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
