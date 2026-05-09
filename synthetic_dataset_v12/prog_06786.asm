; DESCRIPTION: Places a yellow 16x33 rectangle at position (195, 109).
; PLAN: r0=195(x), r1=109(y), r2=16(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 109
LDI r2, 16
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
