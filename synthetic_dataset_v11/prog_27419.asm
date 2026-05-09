; DESCRIPTION: Places a black 54x90 rectangle at position (36, 38).
; PLAN: r0=36(x), r1=38(y), r2=54(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 38
LDI r2, 54
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
