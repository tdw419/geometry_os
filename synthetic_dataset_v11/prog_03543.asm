; DESCRIPTION: Places a cyan 66x59 rectangle at position (165, 17).
; PLAN: r0=165(x), r1=17(y), r2=66(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 17
LDI r2, 66
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
