; DESCRIPTION: Places a yellow 49x27 rectangle at position (433, 1).
; PLAN: r0=433(x), r1=1(y), r2=49(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 1
LDI r2, 49
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
