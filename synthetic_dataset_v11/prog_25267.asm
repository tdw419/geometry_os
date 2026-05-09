; DESCRIPTION: Places a black 120x44 rectangle at position (32, 50).
; PLAN: r0=32(x), r1=50(y), r2=120(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 50
LDI r2, 120
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
