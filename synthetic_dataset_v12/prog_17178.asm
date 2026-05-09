; DESCRIPTION: Places a yellow 75x98 rectangle at position (293, 16).
; PLAN: r0=293(x), r1=16(y), r2=75(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 16
LDI r2, 75
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
