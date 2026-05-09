; DESCRIPTION: Places a blue 27x106 rectangle at position (367, 137).
; PLAN: r0=367(x), r1=137(y), r2=27(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 137
LDI r2, 27
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
