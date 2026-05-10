; DESCRIPTION: Places a yellow 14x73 rectangle at position (418, 113).
; PLAN: r0=418(x), r1=113(y), r2=14(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 113
LDI r2, 14
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
