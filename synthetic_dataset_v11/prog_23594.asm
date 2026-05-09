; DESCRIPTION: Places a green 101x24 rectangle at position (101, 180).
; PLAN: r0=101(x), r1=180(y), r2=101(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 180
LDI r2, 101
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
