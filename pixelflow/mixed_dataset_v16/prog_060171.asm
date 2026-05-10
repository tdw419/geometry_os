; DESCRIPTION: Places a black 94x91 rectangle at position (50, 91).
; PLAN: r0=50(x), r1=91(y), r2=94(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 91
LDI r2, 94
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
