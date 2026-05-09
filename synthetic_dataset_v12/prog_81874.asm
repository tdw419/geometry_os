; DESCRIPTION: Places a black 27x21 rectangle at position (191, 0).
; PLAN: r0=191(x), r1=0(y), r2=27(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 0
LDI r2, 27
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
