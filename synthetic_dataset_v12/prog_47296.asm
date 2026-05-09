; DESCRIPTION: Places a black 27x60 rectangle at position (20, 127).
; PLAN: r0=20(x), r1=127(y), r2=27(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 127
LDI r2, 27
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
