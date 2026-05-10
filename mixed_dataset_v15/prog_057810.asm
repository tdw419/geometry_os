; DESCRIPTION: Places a black 27x72 rectangle at position (57, 84).
; PLAN: r0=57(x), r1=84(y), r2=27(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 84
LDI r2, 27
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
