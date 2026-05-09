; DESCRIPTION: Places a cyan 40x11 rectangle at position (210, 18).
; PLAN: r0=210(x), r1=18(y), r2=40(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 18
LDI r2, 40
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
