; DESCRIPTION: Places a red 39x105 rectangle at position (396, 144).
; PLAN: r0=396(x), r1=144(y), r2=39(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 144
LDI r2, 39
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
