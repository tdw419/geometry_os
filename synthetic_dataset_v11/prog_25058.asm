; DESCRIPTION: Places a purple 27x59 rectangle at position (4, 166).
; PLAN: r0=4(x), r1=166(y), r2=27(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 166
LDI r2, 27
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
