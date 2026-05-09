; DESCRIPTION: Places a yellow 27x68 rectangle at position (223, 163).
; PLAN: r0=223(x), r1=163(y), r2=27(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 163
LDI r2, 27
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
