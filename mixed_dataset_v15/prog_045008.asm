; DESCRIPTION: Places a black 36x12 rectangle at position (386, 65).
; PLAN: r0=386(x), r1=65(y), r2=36(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 65
LDI r2, 36
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
