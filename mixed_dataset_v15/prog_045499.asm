; DESCRIPTION: Places a cyan 112x24 rectangle at position (74, 59).
; PLAN: r0=74(x), r1=59(y), r2=112(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 59
LDI r2, 112
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
