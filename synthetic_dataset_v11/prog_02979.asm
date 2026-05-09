; DESCRIPTION: Places a green 106x82 rectangle at position (94, 152).
; PLAN: r0=94(x), r1=152(y), r2=106(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 152
LDI r2, 106
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
