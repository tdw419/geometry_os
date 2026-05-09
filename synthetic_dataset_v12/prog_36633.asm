; DESCRIPTION: Places a black 44x47 rectangle at position (193, 103).
; PLAN: r0=193(x), r1=103(y), r2=44(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 103
LDI r2, 44
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
