; DESCRIPTION: Places a yellow 27x13 rectangle at position (368, 222).
; PLAN: r0=368(x), r1=222(y), r2=27(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 222
LDI r2, 27
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
