; DESCRIPTION: Places a green 25x74 rectangle at position (372, 93).
; PLAN: r0=372(x), r1=93(y), r2=25(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 93
LDI r2, 25
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
