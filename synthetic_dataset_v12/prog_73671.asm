; DESCRIPTION: Places a cyan 33x25 rectangle at position (318, 43).
; PLAN: r0=318(x), r1=43(y), r2=33(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 43
LDI r2, 33
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
