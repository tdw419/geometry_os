; DESCRIPTION: Places a black 21x50 rectangle at position (300, 17).
; PLAN: r0=300(x), r1=17(y), r2=21(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 17
LDI r2, 21
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
