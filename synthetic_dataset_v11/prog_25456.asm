; DESCRIPTION: Places a white 15x63 rectangle at position (111, 55).
; PLAN: r0=111(x), r1=55(y), r2=15(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 55
LDI r2, 15
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
