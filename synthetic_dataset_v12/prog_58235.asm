; DESCRIPTION: Places a cyan 59x19 rectangle at position (200, 181).
; PLAN: r0=200(x), r1=181(y), r2=59(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 181
LDI r2, 59
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
