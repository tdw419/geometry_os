; DESCRIPTION: Places a black 27x79 rectangle at position (81, 172).
; PLAN: r0=81(x), r1=172(y), r2=27(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 172
LDI r2, 27
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
