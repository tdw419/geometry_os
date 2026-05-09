; DESCRIPTION: Places a black 27x35 rectangle at position (251, 60).
; PLAN: r0=251(x), r1=60(y), r2=27(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 60
LDI r2, 27
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
