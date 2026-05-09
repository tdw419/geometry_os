; DESCRIPTION: Places a green 82x23 rectangle at position (222, 221).
; PLAN: r0=222(x), r1=221(y), r2=82(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 221
LDI r2, 82
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
