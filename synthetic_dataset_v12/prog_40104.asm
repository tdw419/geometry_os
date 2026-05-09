; DESCRIPTION: Places a yellow 97x28 rectangle at position (355, 27).
; PLAN: r0=355(x), r1=27(y), r2=97(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 27
LDI r2, 97
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
