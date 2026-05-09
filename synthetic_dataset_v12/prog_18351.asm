; DESCRIPTION: Places a black 33x27 rectangle at position (355, 224).
; PLAN: r0=355(x), r1=224(y), r2=33(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 224
LDI r2, 33
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
