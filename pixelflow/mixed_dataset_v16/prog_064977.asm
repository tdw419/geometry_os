; DESCRIPTION: Renders a white box of size 94x94 starting at (218, 127).
; PLAN: r0=218(x), r1=127(y), r2=94(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 127
LDI r2, 94
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
