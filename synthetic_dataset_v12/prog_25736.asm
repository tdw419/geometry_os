; DESCRIPTION: Places a cyan 12x99 rectangle at position (204, 45).
; PLAN: r0=204(x), r1=45(y), r2=12(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 45
LDI r2, 12
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
