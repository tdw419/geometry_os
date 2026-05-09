; DESCRIPTION: Places a black 111x63 rectangle at position (135, 68).
; PLAN: r0=135(x), r1=68(y), r2=111(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 68
LDI r2, 111
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
