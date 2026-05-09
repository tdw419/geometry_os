; DESCRIPTION: Places a black 39x63 rectangle at position (271, 91).
; PLAN: r0=271(x), r1=91(y), r2=39(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 91
LDI r2, 39
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
