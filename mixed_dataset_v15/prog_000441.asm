; DESCRIPTION: Places a yellow 61x18 rectangle at position (151, 132).
; PLAN: r0=151(x), r1=132(y), r2=61(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 132
LDI r2, 61
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
