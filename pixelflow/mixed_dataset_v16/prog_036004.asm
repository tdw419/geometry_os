; DESCRIPTION: Places a cyan 40x94 rectangle at position (81, 59).
; PLAN: r0=81(x), r1=59(y), r2=40(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 59
LDI r2, 40
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
